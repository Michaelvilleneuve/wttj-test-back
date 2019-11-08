ENV['APP_ENV'] = 'test'

require 'rack/test'
require 'minitest/autorun'
require 'active_support'
require_relative '../app'

class AppTest < ActiveSupport::TestCase
  include Rack::Test::Methods

  def app
    ::Sinatra::Application
  end

  test 'attempts to create a websocket connection' do
    assert_raises SinatraWebsocket::Error::ConnectionError do
      get '/'
    end
  end
end
