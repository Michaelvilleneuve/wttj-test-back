require_relative '../test_helper'
require_relative '../../lib/mappers/job_offer_mapper'

module Mappers
  class JobOfferMapperTest < TestHelper
    test 'mapper returns results from all combined mappers' do
      h = JobOfferMapper.with(Seed.process, rootless: true)

      assert_equal 'Stage - Account Manager', h[:name]
      assert_equal 'Steve Jobs', h[:columns][0][:applications][0][:user][:firstName]
    end
  end
end