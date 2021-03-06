require_relative "../../config/environment.rb"
require_relative "../models/fweet.rb"
require_relative "../models/user.rb"
require "pry"
class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, "fwitter"
  end
  
  get "/" do
#     Fweet.create("Giancarlo", "I don't know")
    if logged_in?
      @users = User.all
      @fweets = Fweet.all # We set an instance variable, @fweets, which will be an array containing every Fweet from our database. 
      erb :index
    else
      redirect "/login"
    end
  end
  
  post '/' do
    Fweet.create(:user_id => params[:user], :content => params[:fweet])
#     The create methods makes a new Fweet, sets the user and content from params, and then saves it to the database. 
#     This can also be done by doing: 
#     @fweet = Fweet.new
#     @fweet.user = params[:user]
#     @fweet.content = params[:content]
#     @fweet.save saves the fweet to the database
    
    @fweets = Fweet.all # Why do we set the @fweets instance variable after creating the new Fweet?
    
    # Here are some example methods that we can use with ActiveRecord
    #     @first_fweet = Fweet.first - returns the first Fweet
    #     @last_fweet = Fweet.last - returns the last (ie most recent) fweet
    #     @my_tweet = Fweet.find_by(user: "Ian") - find_by finds a fweet by any property, in this case we're passing in user: "Ian"
    #     @fourth_fweet = Fweet.find(4) - find finds the fweet by ID number
    #     @by_sql = Fweet.find_by_sql("SELECT * FROM fweets") - we can always drop down and write SQL statements to select our fweets as wel
    redirect to("/")
  end
  
  get "/login" do
    erb :login
  end
  
  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect to "/"
    else
      redirect "/login"
    end
  end
  
  get "/new_user" do
    erb :new_user
  end
  
  post "/new_user" do
    User.create(username: params[:username], first_name: params[:firstname], last_name: params[:lastname])
    redirect to("/")
  end
  
  get '/logout' do
    session[:user_id] = nil
    redirect "/login"
  end
  
  ### HELPER METHODS 
  
  def current_user
    User.find(session[:user_id])
  end
  
  def logged_in?
    session[:user_id]
  end
  
end