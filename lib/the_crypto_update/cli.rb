# our cli controller - business logic or user interactions/ dealing with input
#require 'colorize'
#require 'pry'
class TheCryptoUpdate::CLI

  def call
    list_top_coins
    menu
    # my_watch_list
    close_cli_app
  end

  def list_top_coins
    # here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    puts ""
    puts "Todays crypto update:"
    puts "--------------------------------------"
    puts "  Coin (Symbol) | Price | 24hr Change |"
    puts "--------------------------------------"
    @coins = TheCryptoUpdate::Coin.current
    @coins.each.with_index(1) do |coin, i|
      puts "#{i}. #{coin.name} (#{coin.symbol}) | $#{coin.price} | #{coin.twemty_four_hr_change}% |"
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
        puts "Enter the number of the coin you'd like more info on or type list to see the deals again or type exit:"
        input = gets.strip.downcase

        if input.to_i > 0
          the_coin = @coins[input.to_i-1]
          puts "#{the_coin.name} (#{the_coin.symbol}) | $#{the_coin.price} | #{the_coin.twemty_four_hr_change}% |"
        elsif input == "list"
          list_top_coins
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
