class Review
  attr_reader :customer, :restaurant, :content

  ALL = []

  def self.all
    ALL
  end

  def initialize(customer, restaurant, content)
    @customer   = customer
    @restaurant = restaurant
    @content = content
    ALL << self
  end

end
