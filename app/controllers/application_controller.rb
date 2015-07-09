require_relative "../../config/environment.rb"
require_relative "../models/fweet.rb"
class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/" do
#     Fweet.create("Giancarlo", "I don't know")
    @fweets = Fweet.all # We set an instance variable, @fweets, which will be an array containing every Fweet from our database. 
    erb :index
  end
  
  post '/' do
    Fweet.create(:user => params[:user], :content => params[:fweet])
#     The create methods makes a new Fweet, sets the user and content from params, and then saves it to the database. 
#     This can also be done by doing: 
#     @fweet = Fweet.new
#     @fweet.user = params[:user]
#     @fweet.content = params[:content]
#     @fweet.save saves the fweet to the database
    @fweets = Fweet.all
    
    # Here are some example methods that we can use with ActiveRecord
    #     @first_fweet = Fweet.first - returns the first Fweet
    #     @last_fweet = Fweet.last - returns the last (ie most recent) fweet
    #     @my_tweet = Fweet.find_by(user: "Ian") - find_by finds a fweet by any property, in this case we're passing in user: "Ian"
    #     @fourth_fweet = Fweet.find(4) - find finds the fweet by ID number
    #     @by_sql = Fweet.find_by_sql("SELECT * FROM fweets") - we can always drop down and write SQL statements to select our fweets as wel
    erb :index
  end


  
end