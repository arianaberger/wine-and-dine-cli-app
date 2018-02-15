class WineAndDine::Scraper

  BASE_PATH = "https://www.opentable.com"

  # def get_page(city) #test for Miami
  #   Nokogiri::HTML(open(BASE_PATH + "#{city}-restaurant-listings"))
  # end

  def self.scrape_restaurants_list(city)

    doc = Nokogiri::HTML(open(BASE_PATH + "/#{city}-restaurant-listings"))

    restaurants_array = []

    doc.css("div.rest-row-info").each do |restaurant| #need to limit the amount of restaurants we are seeing
      # unless restaurant.css("div.rest-row-pricing").text != "$ $ $ $" >>how to only see priciest?
      restaurant_hash = {
        :name => restaurant.css("span.rest-row-name-text").text,
        :food_type => restaurant.css("span.rest-row-meta--cuisine").text,
        :times => restaurant.css("a.rest-row-times-btn").text.strip, #might need to iterate over divs
        :price => restaurant.css("div.rest-row-pricing").text.strip,
        :url => BASE_PATH + restaurant.css("a.rest-row-name")[0]['href']
      }
      restaurants_array << restaurant_hash
      binding.pry
    end
    restaurants_array
  end

  def self.scrape_restaurant_details(restaurant_url) 
    doc = Nokogiri::HTML(open(restaurant_url))
# doc = Nokogiri::HTML(open("https://www.opentable.com/council-oak-steaks-and-seafood-at-seminole-hard-rock-hotel-and-casino-hollywood-florida")
    restaurant_hash = {}
    binding.pry

    restaurant_hash[:rating] =  doc.css("div._491257d8 span").text  + "/5"
    restaurant_hash[:location] = doc.css("div.a.dee8a254._0c64fd38").text
    # restaurant_hash[:telephone] =
    # restaurant_hash[:website] = link to visit open table to make reservation, or just company website






  end

end
