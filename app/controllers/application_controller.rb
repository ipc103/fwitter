require_relative "../../config/environment"
require_relative "../models/fweet.rb"
class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/" do
    "Hello World"
  end
  
end