require_relative '../test_helper'
require_relative '../../lib/router'
require_relative '../../lib/controllers/job_offers_controller'

class RouterTest < TestHelper
  test 'handler_for raises if controller is missing' do
    assert_raises(NameError) do
      Router.new(
        controller: 'Missing',
        action: 'coucou'
      ).handler
    end
  end

  test 'handler_for returns correct controller for given request' do
    assert_equal Controllers::JobOffersController, Router.new(controller: 'JobOffer', action: 'coucou').handler
  end

  test 'handle calls correct method with correct params' do
    params = {
      controller: 'JobOffers',
      action: 'coucou',
      some: 'param'
    }
    stub = Controllers::JobOffersController.new(params)

    Controllers::JobOffersController.expects(:new).with(params).once.returns(stub)
    stub.expects(:coucou)

    Router.new(params).handle
  end
end
