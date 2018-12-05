require 'open-uri'
require 'nokogiri'
require 'pry'

class TheCryptoUpdate::Coin
  attr_accessor :name, :symbol, :volume_1d, :volume_7d, :volume_30d

  @@all = []

  def initialize(coin_hash)
    #binding.pry
      if coin_hash[:name] != nil
      coin_hash.each {|key, value| self.send(("#{key}="), value) }
      @@all << self
    end
  end

  def self.all
    @@all
  end

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

    a_coin_obj = self.new(name: nil, symbol: nil, volume_1d: nil,volume_7d: nil, volume_30d: nil)

    coin_attributes = []
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/volume/monthly/"))

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

















      # a_coin_obj = self.new(name: name,symbol: symbol, volume_1d: volume_1d, volume_7d: volume_7d,volume_30d: volume_30d)
    # coin_attributes << {name: symbol, symbol: name, price: price, twemty_four_hr_change: twemty_four_hr_change, url: url}

# name = coin.css("tr#id-bitcoin a.link-secondary").text # name
# symbol = coin.css("tr#id-bitcoin td.text-left").text
# # volume_1d = coin.css("tbody.row a.link-secondary").text
# volume_1d = coin.css("td.text-right")[0].text.strip
# volume_7d = coin.css("td.text-right")[1].text.strip
# volume_30d = coin.css("td.text-right")[2].text.strip


#doc.css("tbody.s1apzr5v-2.ixZYaO div.name").text # collection of coins
#doc.css("tbody.s1apzr5v-2.ixZYaO span.abbr")[0].text # symbol
#doc.css("tbody.s1apzr5v-2.ixZYaO span.fullName")[0].text # name
#doc.css("div.s1oak5r5-1.hvtvia")[0].text # price
#doc.css("div.cw0nen-1.hUhTmi")[0].text # twemty_four_hr_change


# doc.css("tbody").children.map {|something| something.text}.compact

# doc.css("div").css("tr")[3]

# [17] pry(TheCryptoUpdate::Coin)> doc.css("div").css("tr")[1].css("a").text
# => "Bitcoin$5,390,905,206$34,204,902,516$157,746,142,836"

# [6] pry(TheCryptoUpdate::Coin)> doc.css("div").css("tr")[0].text
# => "\n#\nName\nSymbol\nVolume (1d)\nVolume (7d)\nVolume (30d)\n"
# [7] pry(TheCryptoUpdate::Coin)> doc.css("div").css("tr")[1].text
# => "\n\n1\n\n\n\nBitcoin\n\nBTC\n\n$5,390,905,206\n\n\n$34,204,902,516\n\n\n$157,746,142,836\n\n"
# [8] pry(TheCryptoUpdate::Coin)> doc.css("div").css("tr")[2].text
# => "\n\n2\n\n\n\nTether\n\nUSDT\n\n$3,332,443,355\n\n\n$21,733,057,647\n\n\n$106,856,174,703\n\n"
# [9] pry(TheCryptoUpdate::Coin)> doc.css("div").css("tr")[3].text
# => "\n\n3\n\n\n\nEthereum\n\nETH\n\n$1,875,181,858\n\n\n$12,066,793,281\n\n\n$59,030,390,209\n\n"
# [10] pry(TheCryptoUpdate::Coin)> doc.css("div").css("tr")[4].text
# => "\n\n4\n\n\n\nEOS\n\nEOS\n\n$841,396,473\n\n\n$4,953,000,504\n\n\n$25,043,775,224\n\n"

# doc.css("div").css("tr")[1].css("a").first


# good - doc.css("div").css("tr")[2].css("a").text.split("$")
