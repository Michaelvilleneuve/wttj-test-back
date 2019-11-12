require_relative 'test_helper'
require_relative '../lib/user'

class UserTest < TestHelper
  setup do
    @user = User.new('Michael')
  end

  test 'user has a name' do
    assert_equal 'Michael', @user.first_name
  end
end
