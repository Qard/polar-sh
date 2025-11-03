require "../spec_helper"

describe Polar::PaginatedIterator do
  describe "#next" do
    it "fetches and iterates through multiple pages" do
      # Create a mock fetcher that returns different pages
      pages = [
        Polar::Models::ListResource(String).from_json(%({
          "items": ["item1", "item2"],
          "pagination": {"total_count": 5, "max_page": 3}
        })),
        Polar::Models::ListResource(String).from_json(%({
          "items": ["item3", "item4"],
          "pagination": {"total_count": 5, "max_page": 3}
        })),
        Polar::Models::ListResource(String).from_json(%({
          "items": ["item5"],
          "pagination": {"total_count": 5, "max_page": 3}
        })),
      ]

      page_index = 0
      fetcher = ->(page : Int32) {
        result = pages[page - 1]
        page_index = page
        result
      }

      iterator = Polar::PaginatedIterator(String).new(fetcher)

      # Collect all items
      items = iterator.to_a

      items.should eq(["item1", "item2", "item3", "item4", "item5"])
    end

    it "handles empty pages" do
      empty_page = Polar::Models::ListResource(String).from_json(%({
        "items": [],
        "pagination": {"total_count": 0, "max_page": 1}
      }))

      fetcher = ->(page : Int32) { empty_page }
      iterator = Polar::PaginatedIterator(String).new(fetcher)

      iterator.to_a.should eq([] of String)
    end

    it "stops at max_page" do
      # Create pages where max_page is 2
      pages = [
        Polar::Models::ListResource(String).from_json(%({
          "items": ["item1"],
          "pagination": {"total_count": 2, "max_page": 2}
        })),
        Polar::Models::ListResource(String).from_json(%({
          "items": ["item2"],
          "pagination": {"total_count": 2, "max_page": 2}
        })),
      ]

      fetch_count = 0
      fetcher = ->(page : Int32) {
        fetch_count += 1
        pages[page - 1]
      }

      iterator = Polar::PaginatedIterator(String).new(fetcher)
      items = iterator.to_a

      items.should eq(["item1", "item2"])
      fetch_count.should eq(2) # Should only fetch 2 pages
    end
  end

  describe "#rewind" do
    it "resets the iterator to the beginning" do
      pages = [
        Polar::Models::ListResource(String).from_json(%({
          "items": ["item1", "item2"],
          "pagination": {"total_count": 2, "max_page": 1}
        })),
      ]

      fetcher = ->(page : Int32) { pages[page - 1] }
      iterator = Polar::PaginatedIterator(String).new(fetcher)

      # First iteration
      first_items = iterator.first(2).to_a
      first_items.should eq(["item1", "item2"])

      # Rewind
      iterator.rewind

      # Second iteration should return same items
      second_items = iterator.first(2).to_a
      second_items.should eq(["item1", "item2"])
    end
  end

  describe "Iterator methods" do
    it "supports #first" do
      page = Polar::Models::ListResource(String).from_json(%({
        "items": ["item1", "item2", "item3"],
        "pagination": {"total_count": 3, "max_page": 1}
      }))

      fetcher = ->(page_num : Int32) { page }
      iterator = Polar::PaginatedIterator(String).new(fetcher)

      iterator.first(2).to_a.should eq(["item1", "item2"])
    end

    it "supports #select" do
      page = Polar::Models::ListResource(String).from_json(%({
        "items": ["apple", "banana", "apricot"],
        "pagination": {"total_count": 3, "max_page": 1}
      }))

      fetcher = ->(page_num : Int32) { page }
      iterator = Polar::PaginatedIterator(String).new(fetcher)

      filtered = iterator.select { |item| item.starts_with?("a") }.to_a
      filtered.should eq(["apple", "apricot"])
    end

    it "supports #map" do
      page = Polar::Models::ListResource(String).from_json(%({
        "items": ["a", "b", "c"],
        "pagination": {"total_count": 3, "max_page": 1}
      }))

      fetcher = ->(page_num : Int32) { page }
      iterator = Polar::PaginatedIterator(String).new(fetcher)

      mapped = iterator.map(&.upcase).to_a
      mapped.should eq(["A", "B", "C"])
    end
  end
end
