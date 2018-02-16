class WineAndDine::Scraper

  BASE_PATH = "https://www.opentable.com"

  # def get_page(city) #test for Miami
  #   Nokogiri::HTML(open(BASE_PATH + "#{city}-restaurant-listings"))
  # end

  def self.scrape_restaurants_list(city)
    doc = Nokogiri::HTML(open(BASE_PATH + "/#{city}-restaurant-listings"))
# Testing----------------
#
#
#     t_1 = r.css("a.rest-row-times-btn")[0].text.strip
#     t_2 = r.css("a.rest-row-times-btn")[1].text.strip
#     t_3 = r.css("a.rest-row-times-btn")[2].text.strip
#     t_4 = r.css("a.rest-row-times-btn")[3].text.strip
#     t_5 = r.css("a.rest-row-times-btn")[4].text.strip
#
#     ###use this logic to get individual times
#     times = [t_1, t_2, t_3, t_4, t_5].reject{|e| e.to_i == 0}.join(", ")
#
#     ##How is this possible? Why is it not recognizing the empy strings?
#     [" ", " ", " ", "8:30 pm", "8:45 pm"]
#     times.include?(" ")
#     => false
# ----------------

    r = doc.css("div.rest-row-info")[1]

    restaurants_array = []

    t_1 = r.css("a.rest-row-times-btn")[0].text.strip
    t_2 = r.css("a.rest-row-times-btn")[1].text.strip
    t_3 = r.css("a.rest-row-times-btn")[2].text.strip
    t_4 = r.css("a.rest-row-times-btn")[3].text.strip
    t_5 = r.css("a.rest-row-times-btn")[4].text.strip
    times_r = [t_1, t_2, t_3, t_4, t_5].reject{|e| e.to_i == 0}.join(", ")

    restaurant_hash = {
      :name => r.css("span.rest-row-name-text").text,
      :food_type => r.css("span.rest-row-meta--cuisine").text,
      :times => times_r,
      :price => r.css("div.rest-row-pricing i").text.strip.gsub(/\s+/, ""),
      :rating => r.css("span.recommended-text").text.gsub("% Recommend", ""),
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
