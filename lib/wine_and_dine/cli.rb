class WineAndDine::CLI

  def call
    welcome
  end

  def welcome
    puts "Oh no! You forgot it's you and your boo's anniversay AGAIN! Good thing they"
    puts "reminded you this morning by telling you how excited they are for what you have"
    puts "planned tonight. Looks like you'll need to make some dinner reservations asap!"
    puts ""
    puts "@};---   @};---   @};---   @};---   @};---   @};---   @};---   @};---   @};---".colorize(:red)
    puts ""
    puts "First, enter the number of the romantic destination you'd like to fly to on your private jet tonight:"
    puts "1. NYC"
    puts "2. Miami"
    puts "3. Washington DC"
    puts "4. Las Vegas"

    choose_city
  end

  def choose_city
    input = gets.strip
    if input == "1"
      puts "Let's check out the restaurants in NYC..."
    elsif input == "2"
      puts "Retrieving the best restaurants in Miami..."
      make_restaurants("miami") #make dynamic?
      display_list
    elsif input == "3"
      puts "Retrieving the best restaurants in DC..."
      make_restaurants("dc") #make dynamic?
      display_list
    elsif input == "4"
      puts "Retrieving the best restaurants in Vegas..."
      make_restaurants("las-vegas") #make dynamic?
      display_list

     ####this is not looping properly!
     else
      puts "I'm sorry, please enter the number or city name you'd like to dine in tonight:"
      input = gets.strip
    end
  end

  def make_restaurants(city)
    r_array =  WineAndDine::Scraper.scrape_restaurants_list(city)
    WineAndDine::Restaurants.create_from_city(r_array)
  end

  def display_list
    WineAndDine::Restaurants.all.each_with_index do |r, i|
      puts ""
      puts "----------"
      puts "#{i + 1}. #{r.name.upcase}"
      puts "Type:               #{r.food_type}"
      # puts "Times available:    #{r.times}"
      puts "Price Range:        #{r.price}"
      puts "Rating:             #{r.rating}/100"
    end
  end

end
