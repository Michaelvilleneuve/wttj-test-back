require_relative 'test_helper'
require_relative '../lib/job_offer'
require_relative '../lib/seed'

class JobOfferTest < TestHelper
  test 'creating a job offer automatically creates default columns' do
    offer = JobOffer.new('Stage - Account Manager')

    assert_equal 2, offer.columns.size
    offer.columns.each do |column|
      assert column.is_a?(Column), 'Must be an actual Column'
    end
  end

  test 'apply allows a user to apply to a job' do
    offer = JobOffer.new('Stage - Account Manager')
    assert_equal 0, offer.applications.size

    offer.apply(user = User.new('Michael'))

    assert_equal user, offer.applications[0].user
    assert_equal offer, offer.applications[0].job
  end

  test 'applications_in allows to find application in given column' do
    offer = JobOffer.new('Stage - Account Manager')
    application = offer.apply(user = User.new('Michael'))

    assert offer.applications_in('À rencontrer').include?(application)
    assert_not offer.applications_in('Entretien').include?(application) 
    assert_equal [], offer.applications_in('Coucou lol')
  end
end
