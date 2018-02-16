class WineAndDine::Restaurants

  attr_accessor :name, :food_type, :price, :times, :url

  @@all = []

  def initialize(restaurant_hash)
    restaurant_hash.each{|k,v| self.send("#{k}=", v)}
    @@all << self
  end

  def self.create_from_city(restaurants_array) #this will be the array of restaurants from the scraper class
    #iterate and create a new restaurant for each, with initialize input the restaurant's hash of attributes
    restaurants_array.each do |r|
        WineAndDine::Restaurants.new(r)
    end
  end

  def self.all
    @@all
  end

end

#find_city  to find city restaurants
#find_retaurant to find specific retaurant details
