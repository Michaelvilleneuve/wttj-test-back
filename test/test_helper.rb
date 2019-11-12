ENV['APP_ENV'] = 'test'

require 'rack/test'
require 'minitest/autorun'
require 'active_support'
require 'minitest/unit'
require 'mocha/minitest'
require_relative '../app'

class TestHelper < ActiveSupport::TestCase
  include Rack::Test::Methods

  def app
    ::Sinatra::Application
  end
end
