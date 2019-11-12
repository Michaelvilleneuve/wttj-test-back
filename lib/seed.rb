class Seed
  def self.process
    offer = JobOffer.new('Stage - Account Manager')
    user = User.new('Steve Jobs')

    offer.apply(user)

    offer
  end
end
