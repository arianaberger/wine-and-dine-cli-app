class WineAndDine::Scraper

  BASE_PATH = "https://www.opentable.com/"

  # def get_page(city) #test for Miami
  #   Nokogiri::HTML(open(BASE_PATH + "#{city}-restaurant-listings"))
  # end

  def self.scrape_restaurants_list(city)

    doc = Nokogiri::HTML(open(BASE_PATH + "#{city}-restaurant-listings"))

    restaurants_array = []

    doc.css("div.rest-row-info").each do |restaurant|
      # unless restaurant.css("div.rest-row-pricing").text != "$ $ $ $" >>how to only see priciest?
      restaurant_hash = {
        :name => restaurant.css("span.rest-row-name-text").text,
        :food_type => restaurant.css("span.rest-row-meta--cuisine").text,
        :times => restaurant.css("a.rest-row-times-btn").text.strip, #fix this! might need to iterate over divs
        :price => restaurant.css("div.rest-row-pricing").text.strip
      }
      restaurants_array << restaurant_hash
    end
    #need output of an array of hashes for each restaurant
    restaurants_array
  end

  def self.scrape_restaurant_details(restaurant_url)
  end

end
