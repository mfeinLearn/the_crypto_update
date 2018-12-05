# our cli controller - business logic or user interactions/ dealing with input
# require 'colorize'
#require 'pry'
class TheCryptoUpdate::CLI

  def call
    list_top_coins
    menu
    # my_watch_list
    details
    close_cli_app
  end

  def list_top_coins
    # here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    puts ""
    puts "Todays crypto update:"
    puts "Volume is the amount of the coin that has been traded with in a certain time frame...fyi"
    puts "-----------------"
    puts "|  Coin (Symbol) |"
    puts "-----------------"

    TheCryptoUpdate::Coin.scrape_binance

    @coins = TheCryptoUpdate::Coin.all[0..99]
    @coins.each.with_index(1) do |coin, i|
      # puts "#{i}. #{coin.name} (#{coin.symbol}) | $#{coin.volume_1d} | #{coin.volume_7d}% | #{coin.volume_30d}% |"
      puts "#{i}. #{coin.name} (#{coin.symbol})"

    end
  end

  def details
    # here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    puts ""
    puts "Todays crypto update:"
    puts "Volume is the amount of the coin that has been traded with in a certain time frame...fyi"
    puts "----------------------------------------------------------------------"
    puts "|  Coin (Symbol) | Volume (1 day) |  Volume (7 day) | Volume (30 day) |"
    puts "----------------------------------------------------------------------"

    TheCryptoUpdate::Coin.scrape_binance

    @coins = TheCryptoUpdate::Coin.all[0..99]
    @coins.find do |coin|
      puts " #{coin.name} (#{coin.symbol}) | $#{coin.volume_1d} | #{coin.volume_7d}% | #{coin.volume_30d}% |"
    end
  end

  def menu
    puts ""
    # puts "----------------------".colorize(:green)
    # puts "  github:".colorize(:light_blue)
    # puts "----------------------".colorize(:light_blue)
    # puts "----------------------".colorize(:red)
      input = nil
      while input != "exit"
        puts "type: the number of the coin you'd like more info of"
        puts "type: 'list' -  to see the list of coins again"
        puts "type: 'details' - to see the details of the list of coins"
        puts "type: 'exit' - to exit"
        input = gets.strip.downcase

        if input.to_i > 0
          the_coin = @coins[input.to_i-1]
          puts "#{the_coin.name} (#{the_coin.symbol}) | $#{the_coin.volume_1d} | #{the_coin.volume_7d}% | #{the_coin.volume_30d}% |"
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


  # def my_watch_list
  #   puts "My Watch list 🎉 😍:"
  # end

  def close_cli_app
    puts "Bye 👋..."
  end

end
