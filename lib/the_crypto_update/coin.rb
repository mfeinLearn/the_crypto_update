require 'open-uri'
require 'nokogiri'
require 'pry'

class TheCryptoUpdate::Coin
  # attr_accessor - these are methods "setters" and "getters"
  attr_accessor :name, :symbol, :volume_1d, :volume_7d, :volume_30d

  # class method - is an array of Coins instances
  @@all = []

  # this is called when a new coin is created
  # when this method is called it should automatically check if the key :name is not nil
  # if it is not nil then take the hash that is passed into the method and set the attributes
  # to ______________________________________
  def initialize(coin_hash)
    #binding.pry
      #
      if coin_hash[:name] != nil
      coin_hash.each {|key, value| self.send(("#{key}="), value) }
      @@all << self
    end
  end

  # self.all - this access the @@all (class varable) array that stores all of the coins
  def self.all
    @@all
  end

  # self.current - this calls the self.scrape_coins method
  def self.current
    # Scrape coinmarketcap and then return coins based on that data
    self.scrape_coins
  end

  def self.scrape_coins # class method - # this calls the self.scrape_coinmarketcap(class method) and shovel the return value of
                        # self.scrape_coinmarketcap into a coins array then calling the that coins array
    coins = []

    coins << self.scrape_coinmarketcap

    # Go to binance, find the coin
    # extract the properties
    # instantiate a coin

    coins
  end
  # self.scrape_coinmarketcap - this is where all of the scrapping occures!
  # self.scrape_coinmarketcap - class method
  def self.scrape_coinmarketcap
    # a_coin_obj - Creating a new TheCryptoUpdate::Coin object that takes in a name, symbol, volume_1d, volume_7d, volume_30d
    a_coin_obj = self.new(name: nil, symbol: nil, volume_1d: nil,volume_7d: nil, volume_30d: nil)

    coin_attributes = []
    # doc = uses nokogiri ______________________________________
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/volume/monthly/"))

    # gets the result of nokogiri and scraps the coinmarketcap.com website
    # The scrapped data is set to the following varables: name, symbol, volume_1d, volume_7d, volume_30d
    # The scrapped data varable's are set to keys when a new instance of TheCryptoUpdate::Coin is created this
    # new object is set to a new varable a_coin_obj
    doc.css("div").css("tbody").css("tr").each do |coin|
    #  binding.pry
      name = coin.css("a").text.split("$")[0]
      #binding.pry
      symbol = coin.css("td.text-left")[0].children.text
      volume_1d  = coin.css("a").text.split("$")[1]
      volume_7d  = coin.css("a").text.split("$")[2]
      volume_30d  = coin.css("a").text.split("$")[3]

       # coin_attributes << {name: name, volume_1d: volume_1d, volume_7d: volume_7d, volume_30d: volume_30d}
       a_coin_obj = self.new(name: name, symbol: symbol, volume_1d: volume_1d, volume_7d: volume_7d, volume_30d: volume_30d)
       # @@all<< a_coin_obj
    end
    # coin_attributes

    a_coin_obj
#binding.pry
  end
end
