class Seed
  def self.process
    offer = JobOffer.new('Stage - Account Manager')
    user = User.new('Larry Page')
    user2 = User.new('Bill Gates')
    user3 = User.new('Steve Jobs')

    offer.apply(user)
    offer.apply(user2)
    offer.apply(user3)

    offer
  end
end
