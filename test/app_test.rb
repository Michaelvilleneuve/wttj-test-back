require_relative 'test_helper'

class AppTest < TestHelper
  test 'attempts to create a websocket connection' do
    assert_raises SinatraWebsocket::Error::ConnectionError do
      get '/'
    end
  end
end
