class Customer
  attr_accessor :first_name, :last_name

  ALL = []

  def self.all
    ALL
  end

  def self.find_by_name(name)
    self.all.find do |customer|
      customer.full_name == name
    end
  end

  def self.find_all_by_first_name(first_name)
    # return an array of all the custoemrs whose first_name matches what got passed in
    self.all.select {|customer| customer.first_name == first_name }
  end

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    ALL << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def add_review(restaurant_name, content)
    restaurant = Restaurant.find__or_initialize_by_name(restaurant_name)
    Review.new(self, restaurant, content)
  end

  def reviews
    Review.all.select {|review| review.customer == self}
  end

end

# Customer.find_by_name('Ian Candy')
# Customer.all.find do |customer|
#   customer.full_name == 'Ian Candy'
# end
