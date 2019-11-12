module Controllers
  class JobOffersController
    def initialize(params)
      @params = params
      @offer = params[:offer]
    end

    def move
      destination = @offer.columns.find { |c| c.name == @params[:destination] }
      application = @offer.applications.find { |a| a.user.first_name == @params[:user] }
      
      destination.insert(application, @params[:index] || 0)
    end
  end
end