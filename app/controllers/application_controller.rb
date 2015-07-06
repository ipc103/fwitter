require_relative "../../config/environment"
require_relative "../models/fweet.rb"
class ApplicationController < Sinatra::Base
  
  get "/" do
    "Hello World"
  end
  
end