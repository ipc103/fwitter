require "../../config/environment.rb"
require "../models/fweet.rb"
class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/" do
#     Fweet.create("Giancarlo", "I don't know")
    @fweets = Fweet.all
    erb :index
  end
  
  post '/' do
    Fweet.create(:user => params[:user], :content => params[:fweet])
    # @fweet = Fweet.new
    # @fweet.user = params[:user]
    # @fweet.content = params[:content]
    # @fweet.save


    @fweets = Fweet.all
    @first_fweet = Fweet.first
    @last_fweet = Fweet.last
    @my_tweet = Fweet.find_by(user: "Ian")
    @fourth_fweet = Fweet.find(4)
    @by_sql = Fweet.find_by_sql("SELECT * FROM fweets")
    erb :index
  end


  
end