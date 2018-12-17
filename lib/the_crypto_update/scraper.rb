class Scraper

    # self.scrape_coinmarketcap - this is where all of the scrapping occures!
    # self.scrape_coinmarketcap - class method
    #
    # Steps:
    # Go to binance, find the coin
    # extract the properties
    # instantiate a coin
    def self.scrape_coinmarketcap
      # coin_object_hash - Creating a new TheCryptoUpdate::Coin object that takes in a name, symbol, volume_1d, volume_7d, volume_30d
      coin_object_hash = TheCryptoUpdate::Coin.new(name: nil, symbol: nil, volume_1d: nil,volume_7d: nil, volume_30d: nil)

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

        coin_object_hash = TheCryptoUpdate::Coin.new(name: name, symbol: symbol, volume_1d: volume_1d, volume_7d: volume_7d, volume_30d: volume_30d)
      end
      coin_object_hash
    end

end
