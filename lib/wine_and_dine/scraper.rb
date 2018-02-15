class WineAndDine::Scraper

  BASE_PATH = "https://www.opentable.com/"

  # def get_page(city) #test for Miami
  #   Nokogiri::HTML(open(BASE_PATH + "#{city}-restaurant-listings"))
  # end

  def self.scrape_restaurants_list(city)

    doc = Nokogiri::HTML(open(BASE_PATH + "#{city}-restaurant-listings"))

    restaurants_array = []
    binding.pry

    doc.css("div.rest-row-info").each do |restaurant|
      restaurant_hash = {
        :name => 
      }
      restaurants_array << restaurant_hash
    end
    #need output of an array of hashes for each restaurant
    restaurants_array
  end

  def self.scrape_restaurant_details(restaurant_url)
  end

end
