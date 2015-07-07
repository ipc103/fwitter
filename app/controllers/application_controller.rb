require_relative "../../config/environment.rb"
require_relative "../models/fweet.rb"
class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/" do
    Fweet.new("Giancarlo", "I don't know")
    Fweet.new("Alejandro", "I'm all right #ChristopherCross")
    Fweet.new("Daniel", "*shrug - anything")
    Fweet.new("Charles", "How do I use this?")
    Fweet.new("John", "What's up?")
    @fweets = Fweet.all
    erb :index
  end
  
  post '/' do
    Fweet.new(params[:user], params[:fweet])
    @fweets = Fweet.all
    erb :index
  end
  
end