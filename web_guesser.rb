require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
@@remaining_guesses = 5

get '/' do
  @@remaining_guesses -= 1
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => @@SECRET_NUMBER,
    :message => message,
    :background => @background}
  end

  def check_guess(guess)

    if guess.nil?
      message = ""

    else

      guess = guess.to_i

      if guess > SECRET_NUMBER

        if (SECRET_NUMBER-guess).abs <= 5
          @background = "#F5A9A9"
          message = "Too high!"
        elsif  (SECRET_NUMBER-guess).abs > 5
          @background = "#FF0000"
          message = "Way too high!"
        end

      elsif guess < SECRET_NUMBER

        if (SECRET_NUMBER-guess).abs <= 5
          @background= "#F5A9A9"
          message = "Too low!"
        elsif  (SECRET_NUMBER-guess).abs > 5
          @background = "#FF0000"
          message = "Way too low"
        end

      elsif guess == SECRET_NUMBER
        @background = "#74DF00"
        message = "You got it right!"
      end

    end



  end
