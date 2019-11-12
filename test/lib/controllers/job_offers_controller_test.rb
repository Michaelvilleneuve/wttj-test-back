require_relative '../../test_helper'
require_relative '../../../lib/controllers/job_offers_controller'

module Controllers
  class JobOffersControllerTest < TestHelper
    setup do
      @offer = Seed.process
    end

    test 'move moves a user to a column' do
      assert_not_equal 'Entretien', @offer.applications[0].column&.name

      JobOffersController.new(
        offer: @offer,
        user: 'Steve Jobs',
        destination: 'Entretien'
      ).move

      assert_equal 'Entretien', @offer.applications[0].column&.name
    end
  end
end