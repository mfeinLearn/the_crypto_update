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
  ## NOTE: the #call instance method is called in bin/the-crypto-update file
  def call
    ## helper methods:
    Scraper.scrape_coinmarketcap
    list_top_coins
    menu
    details
    help
    close_cli_app
  end

  # #list_top_coins - instance method - gets 100 of the top coins with their attributes: name and symbol
  # expected result - to call the coin class and also call the all class method with all of the coins stored and get
  #   100 of those coins and store them in the instance varable @coins to be used to out-puted in the terminal
  def list_top_coins
    # here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    puts <<-DOC.colorize(:cyan)
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

    @coins = TheCryptoUpdate::Coin.all[0..99]

    @coins.each.with_index(1) do |coin, i|
      # puts "#{i}. #{coin.name} (#{coin.symbol}) | $#{coin.volume_1d} | #{coin.volume_7d}% | #{coin.volume_30d}% |"
      puts "#{i}. #{coin.name} (#{coin.symbol})"
    end

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

    puts ""
    puts "Todays crypto update:"
    puts "Volume is the amount of the coin that has been traded with in a certain time frame...fyi"
    puts "----------------------------------------------------------------------"
    puts "|  Coin (Symbol) | Volume (1 day) |  Volume (7 day) | Volume (30 day) |"
    puts "----------------------------------------------------------------------"
    puts ""

    @coins = TheCryptoUpdate::Coin.all[0..99]

    @coins.find do |coin|
      puts " #{coin.name} (#{coin.symbol}) | $#{coin.volume_1d} | $#{coin.volume_7d} | $#{coin.volume_30d} |"
    end

  end

  # menu - gets user input and direct the user to different methods depending on the input
  # expected - when the user types a word it is then checked to see if it is one of the options
  #
  # if it is not one of the options then it should tell the user that it has
  # no idea what that word mean and to type list or exit
  def menu

    puts ""

    input = nil

    while input != "exit"
      puts "type: 'help' - to see all commands"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i < 100
        the_coin = @coins[input.to_i-1]
        puts "#{the_coin.name} (#{the_coin.symbol}) | $#{the_coin.volume_1d} | $#{the_coin.volume_7d} | $#{the_coin.volume_30d} |".colorize(:green)
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

  end

  def close_cli_app
    puts ""
    puts ""
    puts "Bye 👋..."
    puts ""
    puts ""
  end

end
