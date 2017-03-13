ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'capybara/rails'
require 'corner_stones/all'

# use binding.irb for debugging
require 'irb'

OmniAuth.config.test_mode = true

class ActiveSupport::TestCase

  # Loads all test helpers
  Dir[Rails.root.join("test/helpers/*")].each do |helper|
    require helper
    include Object.const_get(File.basename(helper, ".rb").camelize)
  end

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def fixture_file_path(file)
    Rails.root + "test/fixtures/files/" + file
  end
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  include Warden::Test::Helpers

  def teardown
    super
    Capybara.reset_sessions! # Forget the (simulated) browser state
  end
end
