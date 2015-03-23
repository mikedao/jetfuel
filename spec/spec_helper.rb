require "simplecov"
require "rails_helper"
require "capybara/rspec"
SimpleCov.start

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.include Capybara::DSL
  config.include Rails.application.routes.url_helpers

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.default_formatter = 'doc'

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed
end
