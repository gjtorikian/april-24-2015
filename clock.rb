require 'rubygems'
require 'clockwork'
require 'json'
require 'twitter'
include Clockwork

unless ENV['RACK_ENV'] == 'production'
  require 'dotenv'
  Dotenv.load
end

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["42415_TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["42415_TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["42415_TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["42415_TWITTER_ACCESS_SECRET"]
end

tweets = ['Hey there', 'Tweet out!', 'Quack quack.']
handler do |_|
  tweet = tweets.shift
  client.update(tweet)
end

every(30.seconds, 'tweet')
