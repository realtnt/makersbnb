# This line puts your web application into test mode
# Without it, your tests might mistakenly pass.
ENV['APP_ENV'] = 'test'

# This requires your app file
require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'rspec' # This loads RSpec
require 'rack/test' # This loads the Rack::Test testing tool

# These lines load & set up the Capybara testing tool
require 'capybara/rspec'
Capybara.app = WebApplicationServer

# This module contains some shared setup for your web tests
module WebApplicationTests
  extend RSpec::SharedContext

  # This includes the Rack::Test helper methods in all tests
  include Rack::Test::Methods

  # This tells Rack::Test to request to your Sinatra app
  let(:app) { WebApplicationServer }
end

RSpec.configure do |config|
  config.include WebApplicationTests

  # The following lines are misc RSpec configuration that you don't need to
  # worry about right now.

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
