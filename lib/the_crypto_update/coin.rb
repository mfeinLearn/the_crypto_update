class TheCryptoUpdate::Coin
  attr_accessor :name, :symbol, :price, :twemty_four_hr_change, :url


  def self.current
    # I should return a bunch of instances of Coin
    # puts <<-DOC.gsub /^\s*/, ''
    #  Coin (Symbol)               |       Price     |   24hr Change
    #  -----------------------------------------------------------
    #  1. Bitcoin (BTC)             |       $4040.63  |   -4.01 %
    #  2. Ripple (XRP)              |       $0.364702 |   -4.01 %
    #  3. Steller Lumens (XLM)      |       $0.159849 |   1.23 %
    #  4. Bitcoin Coin ABC (BCHABC) |       $173.65   |   -1.31 %
    #  5. EOS (EOS)                 |       $2.88     |   -1.73 %
    # DOC

    coin_1 = TheCryptoUpdate::Coin.new
    coin_1.name = "Bitcoin"
    coin_1.symbol = "BTC"
    coin_1.price = "4040.63"
    coin_1.twemty_four_hr_change = "-4.01"
    coin_1.url = "https://info.binance.com/en"

    coin_2 = TheCryptoUpdate::Coin.new
    coin_2.name = "Ripple"
    coin_2.symbol = "XRP"
    coin_2.price = "0.364702"
    coin_2.twemty_four_hr_change = "-4.01"
    coin_2.url = "https://info.binance.com/en"

    coin_3= TheCryptoUpdate::Coin.new
    coin_3.name = "Steller Lumens"
    coin_3.symbol = "XLM"
    coin_3.price = "0.159849"
    coin_3.twemty_four_hr_change = "1.23"
    coin_3.url = "https://info.binance.com/en"

    coin_4= TheCryptoUpdate::Coin.new
    coin_4.name = "Bitcoin Coin ABC"
    coin_4.symbol = "BCHABC"
    coin_4.price = "173.65"
    coin_4.twemty_four_hr_change = "-1.31"
    coin_4.url = "https://info.binance.com/en"

    coin_5= TheCryptoUpdate::Coin.new
    coin_5.name = "EOS"
    coin_5.symbol = "EOS"
    coin_5.price = "2.88"
    coin_5.twemty_four_hr_change = "-1.73"
    coin_5.url = "https://info.binance.com/en"

    [coin_1, coin_2, coin_3, coin_4, coin_5]
  end


end
