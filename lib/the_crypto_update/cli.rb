# our cli controller - business logic or user interactions/ dealing with input
# require 'colorize'
require 'pry'

# TheCryptoUpdate - namespace
# CLI - the class name is CLI
class TheCryptoUpdate::CLI

  # #call - instance method
  # This is the order of execution  - call procedure - defining all of the things that I want to do
  # 1. list_top_coins
  # 2. menu
  # 3. details
  # 4. close_cli_app
  def call # the #call instance method is called in bin/the-crypto-update file

    ## helper methods
    list_top_coins
    menu
    details
    help
    # my_watch_list
    close_cli_app
  end

  # #list_top_coins - instance method - gets 100 of the top coins with their attributes: name and symbol
  # expected result - to call the coin class and also call the all class method with all of the coins stored and get
  #   100 of those coins and store them in the instance varable @coins to be used to out-puted in the terminal
  def list_top_coins
    # here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
  puts <<-DOC
   ____ ____ ____ _________ ____ ____ ____ ____ ____ ____ _________ ____ ____ ____ ____ ____ ____
  ||T |||h |||e |||       |||C |||r |||y |||p |||t |||o |||       |||U |||p |||d |||a |||t |||e ||
  ||__|||__|||__|||_______|||__|||__|||__|||__|||__|||__|||_______|||__|||__|||__|||__|||__|||__||
  |/__\|/__\|/__\|/_______\|/__\|/__\|/__\|/__\|/__\|/__\|/_______\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\||

  DOC

    puts "Top 100 Cryptocurrencies By Market Capitalization"
    puts ""
    puts "Todays crypto update:"
    puts "-----------------"
    puts "|  Coin (Symbol) |"
    puts "-----------------"

    TheCryptoUpdate::Coin.scrape_coinmarketcap
    @coins = TheCryptoUpdate::Coin.all[0..99]
    @coins.each.with_index(1) do |coin, i|
      # puts "#{i}. #{coin.name} (#{coin.symbol}) | $#{coin.volume_1d} | #{coin.volume_7d}% | #{coin.volume_30d}% |"
      puts "#{i}. #{coin.name} (#{coin.symbol})"

    end

    # test 1
    # puts <<-DOC.gsub /^\s*/, ''
    #
    # 1. Bitcoin (BTC)
    # 2. Tether (USDT)
    # 3. Ethereum (ETH)
    # 4. EOS (EOS)
    # 5. XRP (XRP)
    # 6. Litecoin (LTC)
    # 7. Bitcoin Cash (BCH)
    # 8. Ethereum Cla... (ETC)
    # 9. Dash (DASH)
    # 10. Qtum (QTUM)
    #
    # DOC

    #test 2
    # coin_1 = TheCryptoUpdate::CLI.new
    # coin_1.name = "Bitcoin"
    # coin_1.symbol = "BTC"
    # coin_1.volume_1d = "4040.63"
    # coin_1.volume_7d = "-4.01"
    # coin_1.volume_30d = "https://info.binance.com/en"
    #
    # coin_2 = TheCryptoUpdate::CLI.new
    # coin_2.name = "Ripple"
    # coin_2.symbol = "XRP"
    # coin_2.volume_1d = "0.364702"
    # coin_2.volume_7d = "-4.01"
    # coin_2.volume_30d = "https://info.binance.com/en"
    #
    # coin_3= TheCryptoUpdate::CLI.new
    # coin_3.name = "Steller Lumens"
    # coin_3.symbol = "XLM"
    # coin_3.volume_1d = "0.159849"
    # coin_3.volume_7d = "1.23"
    # coin_3.volume_30d = "https://info.binance.com/en"
    #
    # coin_4= TheCryptoUpdate::CLI.new
    # coin_4.name = "Bitcoin Coin ABC"
    # coin_4.symbol = "BCHABC"
    # coin_4.volume_1d = "173.65"
    # coin_4.volume_7d = "-1.31"
    # coin_4.volume_30d = "https://info.binance.com/en"
    #
    # coin_5= TheCryptoUpdate::CLI.new
    # coin_5.name = "EOS"
    # coin_5.symbol = "EOS"
    # coin_5.volume_1d = "2.88"
    # coin_5.volume_7d = "-1.73"
    # coin_5.volume_30d = "https://info.binance.com/en"
    #
    # [coin_1.name, coin_2.name, coin_3.name, coin_4.name, coin_5.name]

    #binding.pry
  end

  # #help - is an instance method to help users know what commands are availible to them
  def help
    puts ""
    puts "TYPE ONE OF THE FOLLOWING..."
    puts "========================================================="
    puts "type: the number next to the coin you'd like more info of"
    puts " if their is no number type 'list' to view it"
    puts "---------------------------------------------------------"
    puts "type: 'list' -  to see the list of coins again"
    puts "---------------------------------------------------------"
    puts "type: 'details' - to see the details of the list of coins"
    puts "---------------------------------------------------------"
    puts "type: 'exit' - to exit"
    puts "========================================================="
  end


  # #details - instance method - that gets 100 of the top coins with their attributes:
  # name, symbol, Volume (1 day), Volume (7 day), Volume (30 day)
  #
  # expected result - to call the coin class and also call the all class method with all of the coins stored and get
  #   100 of those coins and store them in the instance varable @coins to be used to out-puted in the terminal
  def details
    # here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    puts ""
    puts "Todays crypto update:"
    puts "Volume is the amount of the coin that has been traded with in a certain time frame...fyi"
    puts "----------------------------------------------------------------------"
    puts "|  Coin (Symbol) | Volume (1 day) |  Volume (7 day) | Volume (30 day) |"
    puts "----------------------------------------------------------------------"
    puts ""

    TheCryptoUpdate::Coin.scrape_coinmarketcap

    @coins = TheCryptoUpdate::Coin.all[0..99]
    @coins.find do |coin|
      puts " #{coin.name} (#{coin.symbol}) | $#{coin.volume_1d} | $#{coin.volume_7d} | $#{coin.volume_30d} |"
    end

    # test 1
    # puts <<-DOC.gsub /^\s*/, ''
    # Bitcoin (BTC) | $4,775,342,769 | $32,509,066,104 | $164,810,366,381 |
    # Tether (USDT) | $3,108,760,862 | $21,361,843,844 | $111,105,564,842 |
    # Ethereum (ETH) | $1,679,283,441 | $11,924,292,214 | $61,394,906,973 |
    # EOS (EOS) | $796,768,352 | $5,021,866,952 | $25,967,872,275 |
    # XRP (XRP) | $411,218,718 | $2,867,509,194 | $19,814,324,663 |
    # Litecoin (LTC) | $394,593,514 | $2,741,941,403 | $13,521,000,779 |
    # Bitcoin Cash (BCH) | $63,654,091 | $713,122,140 | $7,111,621,185 |
    # Ethereum Cla... (ETC) | $111,782,348 | $953,437,947 | $5,485,805,072 |
    # Dash (DASH) | $125,256,678 | $973,504,100 | $4,825,876,751 |
    # Qtum (QTUM) | $116,716,202 | $839,504,120 | $4,747,418,927 |
    #
    # DOC

    # test 2
    # coin_1 = TheCryptoUpdate::Coin.new
    # coin_1.name = "Bitcoin"
    # coin_1.symbol = "BTC"
    # coin_1.price = "4040.63"
    # coin_1.twemty_four_hr_change = "-4.01"
    # coin_1.url = "https://info.binance.com/en"
    #
    # coin_2 = TheCryptoUpdate::Coin.new
    # coin_2.name = "Ripple"
    # coin_2.symbol = "XRP"
    # coin_2.price = "0.364702"
    # coin_2.twemty_four_hr_change = "-4.01"
    # coin_2.url = "https://info.binance.com/en"
    #
    # coin_3= TheCryptoUpdate::Coin.new
    # coin_3.name = "Steller Lumens"
    # coin_3.symbol = "XLM"
    # coin_3.price = "0.159849"
    # coin_3.twemty_four_hr_change = "1.23"
    # coin_3.url = "https://info.binance.com/en"
    #
    # coin_4= TheCryptoUpdate::Coin.new
    # coin_4.name = "Bitcoin Coin ABC"
    # coin_4.symbol = "BCHABC"
    # coin_4.price = "173.65"
    # coin_4.twemty_four_hr_change = "-1.31"
    # coin_4.url = "https://info.binance.com/en"
    #
    # coin_5= TheCryptoUpdate::Coin.new
    # coin_5.name = "EOS"
    # coin_5.symbol = "EOS"
    # coin_5.price = "2.88"
    # coin_5.twemty_four_hr_change = "-1.73"
    # coin_5.url = "https://info.binance.com/en"
    #
    # [coin_1.name, coin_2.name, coin_3.name, coin_4.name, coin_5.name]


  end
  # menu - gets user input and direct the user to different methods depending on the input
  # expected - when the user types a word it is then checked to see if it is one of the options
  # if it is not one of the options then it should tell the user that it has
  # no idea what that word mean and to type list or exit
  def menu

    puts ""
    # puts "----------------------".colorize(:green)
    # puts "  github:".colorize(:light_blue)
    # puts "----------------------".colorize(:light_blue)
    # puts "----------------------".colorize(:red)
      input = nil
      while input != "exit"
        puts "type: 'help' - to see all commands"
        input = gets.strip.downcase

        if input.to_i > 0
          the_coin = @coins[input.to_i-1]
          puts "#{the_coin.name} (#{the_coin.symbol}) | $#{the_coin.volume_1d} | $#{the_coin.volume_7d} | $#{the_coin.volume_30d} |"
        elsif input == "help"
          help
        elsif input == "list"
          list_top_coins
        elsif input == "details"
          details
        else
          puts ""
          puts "Not sure what that means, please type list or exit"
          puts ""
        end
      end

    # test 1
    # puts ""
    #   input = nil
    #   while input != "exit"
    #     puts "Enter the number of the deal you'd like more info on or type list"
    #     input = gets.strip.downcase
    #     case input
    #     when "1"
    #       puts "Bitcoin (BTC) | $4,775,342,769 | $32,509,066,104 | $164,810,366,381 |"
    #     when "2"
    #       puts "Tether (USDT) | $3,108,760,862 | $21,361,843,844 | $111,105,564,842 |"
    #     when "list"
    #       list_top_coins
    #     else
    #       puts ""
    #       puts "Not sure what that means, please type list or exit"
    #       puts ""
    #     end
    #   end

  end

  # def my_watch_list
  #   puts "My Watch list 🎉 😍:"
  # end

  def close_cli_app
    puts ""
    puts ""
    puts "Bye 👋..."
    puts ""
    puts ""
  end



end
