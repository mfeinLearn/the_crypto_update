require 'open-uri'
require 'nokogiri'
require 'pry'

class TheCryptoUpdate::Coin

  # attr_accessor - these are methods "setters" and "getters"
  attr_accessor :name, :symbol, :volume_1d, :volume_7d, :volume_30d
  # class method - is an array of Coins instances
  @@all = []

  # #initialize - is called when a new coin is created
  #1. when this method is called it should automatically check if the key :name is not nil
  # if it is not nil then
  #2. take the hash that is passed into the method and  iterate over each key/value pair in the coin_hash
  #3.  The name of the key becomes the name of a setter method and the value associated with the key is the
  # name of the value you want to pass to that method.
  #4. The ruby .send method then calls the method name that is the key’s name, with an argument of the value.
  # 5. then that instance of coin is then shuffled into the the @@all empty array (class varable)
  def initialize(coin_hash)

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

  # class method - this calls the self.scrape_coinmarketcap(class method) and shovel the return value of
  #   self.scrape_coinmarketcap into a coins array then calling the that coins array
  def self.scrape_coins

    coins = []

    coins << self.scrape_coinmarketcap

    coins
  end

  # self.scrape_coinmarketcap - this is where all of the scrapping occures!
  # self.scrape_coinmarketcap - class method
  #
  # Steps:
  # Go to binance, find the coin
  # extract the properties
  # instantiate a coin
  def self.scrape_coinmarketcap
    # a_coin_obj - Creating a new TheCryptoUpdate::Coin object that takes in a name, symbol, volume_1d, volume_7d, volume_30d
    a_coin_obj = self.new(name: nil, symbol: nil, volume_1d: nil,volume_7d: nil, volume_30d: nil)

    # By using the Nokogiri::HTML method - to take the string of the HTML returned by# open-uri’s open method
    # - and - convert it into a NodeSet (aka, a bunch of nested "nodes") sooooo that we can easily play around with
    # —> Nokogiri::HTML(html)
    # We can save the html document in a variable doc
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/volume/monthly/"))

    # gets the result of nokogiri and scraps the coinmarketcap.com website
    # The scrapped data is set to the following varables: name, symbol, volume_1d, volume_7d, volume_30d
    # The scrapped data varable's are set to keys when a new instance of TheCryptoUpdate::Coin is created this
    # new object is set to a new varable a_coin_obj
    doc.css("div").css("tbody").css("tr").each do |coin|
      name = coin.css("a").text.split("$")[0]
      symbol = coin.css("td.text-left")[0].children.text
      volume_1d  = coin.css("a").text.split("$")[1]
      volume_7d  = coin.css("a").text.split("$")[2]
      volume_30d  = coin.css("a").text.split("$")[3]

      a_coin_obj = self.new(name: name, symbol: symbol, volume_1d: volume_1d, volume_7d: volume_7d, volume_30d: volume_30d)
    end
    a_coin_obj
  end

end
