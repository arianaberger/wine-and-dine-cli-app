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
    puts "4. Los Angeles"

    choose_city
  end

  def choose_city
    input = gets.strip
    if input == "1"
      #execute NYC method for list of restaurants 1-5
      puts "Let's check out the restaurants in NYC..."
      list_nyc
        #get info from restaurant list for NYC
          #pull into on an individual restaurants
    elsif input == "2"
      puts "Let's check out the restaurants in Miami"
    elsif input == "3"
      puts "Let's check out the restaurants in DC"
    elsif input == "4"
      puts "Let's check out the restaurants in LA"
    else #this needs to loop properly!
      puts "I'm sorry, please enter the number or city name you'd like to dine in tonight:"
      input = gets.strip
    end
  end

  def list_nyc
    puts "Here are the NYC restaurants"
    puts " 1. 2. 3. 4"
    puts "Which would one would you like to know more about?"
    input = gets.strip
    if input == "1"
      puts "GREAT"
    else #this needs to loop properly!
      puts "Which would one would you like to know more about?"
      input = gets.strip
    end
  end

end
