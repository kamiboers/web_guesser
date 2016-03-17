require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)

  if guess.nil?
    message = ""

  else
    guess = guess.to_i

    if guess > SECRET_NUMBER

      if (SECRET_NUMBER-guess).abs <= 5
        message = "Too high!"
      elsif  (SECRET_NUMBER-guess).abs > 5
        message = "Way too high!"
      end

    elsif guess < SECRET_NUMBER

      if (SECRET_NUMBER-guess).abs <= 5
        message = "Too low!"
      elsif  (SECRET_NUMBER-guess).abs > 5
        message = "Way too low!"
      end

    elsif guess == SECRET_NUMBER
      message = "You got it right!"

    end

  end

end
