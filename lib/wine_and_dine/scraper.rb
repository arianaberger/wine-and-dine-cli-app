class WineAndDine::Scraper

  BASE_PATH = "https://www.opentable.com"

  # def get_page(city) #test for Miami
  #   Nokogiri::HTML(open(BASE_PATH + "#{city}-restaurant-listings"))
  # end

  def self.scrape_restaurants_list(city)
    doc = Nokogiri::HTML(open(BASE_PATH + "/#{city}-restaurant-listings"))

r.css("a.rest-row-times-btn")[3].text.strip


    restaurants_array = []
binding.pry
    r = doc.css("div.rest-row-info")[1]
        restaurant_hash = {
          :name => r.css("span.rest-row-name-text").text,
          :food_type => r.css("span.rest-row-meta--cuisine").text,
          :times => r.css("a.rest-row-times-btn").each{|t| t.css("a.rest-row-times-btn").text unless t.css("a.rest-row-times-btn").text == "  "}.join(", "),
          :price => r.css("div.rest-row-pricing").text.strip,
          :url => BASE_PATH + r.css("a.rest-row-name")[0]['href']
        }
        restaurants_array << restaurant_hash


    ####why does just the first restaurant load?? then it hangs, even though the code works in pry
    # doc.css("div.rest-row-info").each_with_index do |r, i|
    #   #just choose the priciest restaurants?
    #   until i == 1
    #     restaurant_hash = {
    #       :name => r.css("span.rest-row-name-text").text,
    #       :food_type => r.css("span.rest-row-meta--cuisine").text,
    #       :times => r.css("a.rest-row-times-btn").text.strip, #might need to iterate over divs
    #       :price => r.css("div.rest-row-pricing").text.strip,
    #       :url => BASE_PATH + r.css("a.rest-row-name")[0]['href']
    #     }
    #     restaurants_array << restaurant_hash
    #   end
    # end
    # restaurants_array
    # binding.pry
  end

####not working!!!
  def self.scrape_restaurant_details(restaurant_url)
    doc = Nokogiri::HTML(open(restaurant_url))
# doc = Nokogiri::HTML(open("https://www.opentable.com/council-oak-steaks-and-seafood-at-seminole-hard-rock-hotel-and-casino-hollywood-florida"))
    restaurant_hash = {}

    restaurant_hash[:rating] =  doc.css("div._491257d8 span").text  + "/5"
    restaurant_hash[:location] = doc.css("div.a.dee8a254._0c64fd38").text

    # restaurant_hash[:telephone] =
    # restaurant_hash[:website] = link to visit open table to make reservation, or just company website
  end

end
