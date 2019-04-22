require_relative 'config/environment'
require_relative 'models/piglatinizer.rb'

class App < Sinatra::Base
  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    pl_instance = PigLatinizer.new

    @piglatin = pl_instance.piglatinize(params[:user_phrase])

    erb :results
  end
end
