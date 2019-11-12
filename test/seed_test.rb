require_relative 'test_helper'
require_relative '../lib/seed'

class SeedTest < TestHelper
  setup do
    @offer = Seed.process
  end

  test 'process creates default basic database' do
    assert_equal 1, @offer.applications.size
    assert_equal 'Steve Jobs', @offer.applications[0].user.first_name
    assert_equal 'À rencontrer', @offer.applications[0].column.name
  end
end
