require_relative '../lib/restaurants.rb'
require_relative '../lib/scraper.rb'
require 'nokogiri'
require 'colorize'

class CommandLineInterface

  def run
  end

  def choose_city
    puts "Oh no! You forgot it's you and your boo's anniversay AGAIN! Good thing they"
    puts "reminded you this morning by telling you how excited they are for what you have"
    puts "planned tonight. Looks like you'll need to make some dinner reservations asap!"
    puts ""
    puts "@};---   @};---   @};---   @};---   @};---   @};---   @};---   @};---   @};---".colorize(:red)
    puts ""
    puts "First off, please enter which romantic destination you would like to fly to on your private jet tonight:"
    puts "1. NYC"
    puts "2. Miami"
    puts "3. Washington DC"
    puts "4. Los Angeles"

    input = gets.strip
    if input == "1" || input == "NYC"
      #execute NYC method for list of restaurants 1-5
      puts "Let's check out the restaurants in NYC"
    elsif input == "2" || input == "Miami"
      puts "Let's check out the restaurants in Miami"
    elsif input == "3" || input == "Washington DC" || input == "DC"
      puts "Let's check out the restaurants in DC"
    elsif input == "4" || input == "Los Angeles" || input == "LA"
      puts "Let's check out the restaurants in LA"
    else
      puts "I'm sorry, please enter the number or city name you'd like to dine in tonight:"
      input = gets.strip
    end
  end


end
