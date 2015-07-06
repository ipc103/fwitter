require "../../config/environment.rb"
class Fweet
  ALL_TWEETS = []
  attr_accessor :content
  attr_reader :user
  
  def initialize(user, content)
    @user = user
    @content = content
    @retweets = 0
    ALL_TWEETS.push(self)
  end
  
  def self.all
    ALL_TWEETS
  end 
end
