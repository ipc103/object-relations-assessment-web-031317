class Restaurant
  attr_accessor :name

  ALL = []

  def self.all
    ALL
  end

  def self.find_by_name(name)
    self.all.find do |restaurant|
      restaurant.name == name
    end
  end

  def self.find__or_initialize_by_name(name)
    restaurant = Restaurant.find_by_name(name)
    if !restaurant
      restaurant = Restaurant.new(restaurant_name)
    end
    restaurant
  end

  def initialize(name)
    @name = name
    ALL << self
  end

  def reviews
    # Look at all of the reviews that have been created
    # Return the ones whose restaurant is this restaurant
    Review.all.select do |review|
      review.restaurant == self
    end
  end

  def customers
    # have you left a review of this restaurant? If so, you are a customer
    # iterate over all of my reviews
    # return a new array of those reviews' customers
    reviews.map do |review|
      review.customer
    end.uniq
  end
end
