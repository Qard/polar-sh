require "spec"
require "json"
require "time"
require "../src/polar-sh"

# Use sandbox environment for tests
ENV["POLAR_SERVER_URL"] ||= "https://sandbox.polar.sh"
