class WineAndDine::scraper

  def city 
    "miami"
  end

  def get_page(city) #test for Miami
    Nokogiri::HTML(open(https://www.opentable.com/"#{city}"-restaurant-listings))

  def self.scrape_restaurants_list(city_url)
    restaurants_array = []

    get_page.css().each do |restaurant|
      restaurant_hash = {

      }
      restaurants_array << restaurant_hash
    end
    #need output of an array of hashes for each restaurant
    restaurants_array
  end

  def self.scrape_restaurant_details(restaurant_url)
  end

end
