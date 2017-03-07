# -*- coding: utf-8 -*-
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'capybara/rails'
require 'fileutils'

OmniAuth.config.test_mode = true

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def fixture_file_path(file)
    Rails.root + "test/fixtures/files/" + file
  end
end


class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  def teardown
    super
    Capybara.reset_sessions! # Forget the (simulated) browser state
  end

  def assert_flash(message, type:)
    assert_equal "× #{message}", find(".alert-#{type}")
  end
end
