require 'open-uri'
require 'nokogiri'
require 'pry'

class TheCryptoUpdate::Coin
  attr_accessor :name, :symbol, :price, :twemty_four_hr_change, :url


  def self.current
    # Scrape binance and then return coins based on that data
    self.scrape_coins
  end

  def self.scrape_coins
    coins = []

    coins << self.scrape_binance

    # Go to binance, find the coin
    # extract the properties
    # instantiate a coin

    coins
  end

  def self.scrape_binance

    # doc = Nokogiri::HTML(open("https://coinmarketcap.com/"))
    doc = Nokogiri::HTML(open("https://info.binance.com/en"))

    a_coin_obj = self.new
    coin_attributes = []
    doc.css("tbody.s1apzr5v-2.ixZYaO div.name").each do |coin|  # collection of coins
      symbol = coin.css("span.abbr").text # symbol
      name = coin.css("span.fullName").text # name
      price = coin.css("div.s1oak5r5-1.hvtvia").text # price
      twemty_four_hr_change = coin.css("div.cw0nen-1.hUhTmi").text # twemty_four_hr_change
      url = nil

      coin_attributes << {name: symbol, symbol: name, price: price, twemty_four_hr_change: twemty_four_hr_change, url: url}
      end
      binding.pry

      coin_attributes


  end
end

#doc.css("tbody.s1apzr5v-2.ixZYaO div.name").text # collection of coins
#doc.css("tbody.s1apzr5v-2.ixZYaO span.abbr")[0].text # symbol
#doc.css("tbody.s1apzr5v-2.ixZYaO span.fullName")[0].text # name
#doc.css("div.s1oak5r5-1.hvtvia")[0].text # price
#doc.css("div.cw0nen-1.hUhTmi")[0].text # twemty_four_hr_change
