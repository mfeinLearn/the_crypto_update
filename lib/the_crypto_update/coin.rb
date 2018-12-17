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
  def initialize(coin_attributes_hash)

    if coin_attributes_hash[:name] != nil

      coin_attributes_hash.each {|attribute_name, attribute_value| self.send(("#{attribute_name}="), attribute_value) }

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
  #
  # Job: stores coins inside array
  def self.scrape_coins

    coins = []

    coins << Scraper.scrape_coinmarketcap

    coins
  end

end
