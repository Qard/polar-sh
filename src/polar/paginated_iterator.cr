# PaginatedIterator(T)
#
# Lazy iterator for paginated API responses.
#
# This iterator automatically fetches pages as needed, allowing you to
# treat paginated results as a continuous stream without loading all
# pages into memory at once.
#
# ## Usage
#
# ```
# # Create an iterator for all organizations
# iterator = client.organizations.each(limit: 50)
#
# # Process items lazily - only fetches pages as needed
# iterator.each do |org|
#   puts org.name
# end
#
# # Or use Iterator methods
# iterator.first(10).each { |org| puts org.name }
# iterator.select { |org| org.slug.starts_with?("test") }
# ```

require "log"

module Polar
  # Lazy iterator for paginated API responses
  #
  # Automatically fetches pages as needed, yielding items one at a time.
  # Implements Crystal's `Iterator(T)` protocol for full iterator support.
  #
  # @param T The type of items being iterated
  class PaginatedIterator(T)
    include Iterator(T)

    Log = ::Log.for(self)

    @current_page : Int32
    @current_items : Array(T)
    @current_index : Int32
    @max_page : Int64?
    @fetched_first_page : Bool

    # Creates a new paginated iterator
    #
    # @param fetcher A proc that fetches a page given a page number
    # @param limit Optional page size (defaults to API default)
    def initialize(@fetcher : Int32 -> Models::ListResource(T), @limit : Int32? = nil)
      @current_page = 1
      @current_items = [] of T
      @current_index = 0
      @max_page = nil
      @fetched_first_page = false
      Log.debug { "Created paginated iterator with limit: #{@limit || "default"}" }
    end

    # Returns the next item in the iteration
    #
    # Automatically fetches the next page when the current page is exhausted.
    # Returns `Iterator::Stop` when all pages have been consumed.
    #
    # @return The next item or `Iterator::Stop`
    def next
      # Fetch first page if we haven't yet
      unless @fetched_first_page
        fetch_page(@current_page)
        @fetched_first_page = true
      end

      # If we've exhausted the current page, try to fetch the next one
      while @current_index >= @current_items.size
        # Check if we've reached the last page
        if max_page = @max_page
          return stop if @current_page >= max_page
        end

        # Fetch next page
        @current_page += 1
        fetch_page(@current_page)
        @current_index = 0

        # If the new page is empty, we're done
        return stop if @current_items.empty?
      end

      # Return the current item and advance index
      item = @current_items[@current_index]
      @current_index += 1
      item
    end

    # Rewinds the iterator to the beginning
    #
    # This will cause the iterator to start fetching from page 1 again.
    def rewind
      Log.debug { "Rewinding iterator to page 1" }
      @current_page = 1
      @current_items = [] of T
      @current_index = 0
      @max_page = nil
      @fetched_first_page = false
      self
    end

    private def fetch_page(page : Int32)
      Log.debug { "Fetching page #{page}" }
      result = @fetcher.call(page)
      @current_items = result.items
      @max_page = result.pagination.max_page
      @current_index = 0
      Log.debug { "Fetched page #{page}: #{@current_items.size} items (max_page: #{@max_page})" }
    end
  end
end
