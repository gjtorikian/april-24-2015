require 'rubygems'
require 'clockwork'
require 'twitter'
include Clockwork

unless ENV['RACK_ENV'] == 'production'
  require 'dotenv'
  Dotenv.load
end

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['42415_TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['42415_TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV['42415_TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['42415_TWITTER_ACCESS_SECRET']
end

tweets_file = File.read('tweets.txt')

tweets = []
tweets_file.split("\n").each_with_index do |tweet, i|
  tweets << "#{i + 1}. #{tweet} #ArmenianGenocide"
end

response = nil

handler do |_|
  unless tweets.empty?
    tweet = tweets.shift
    client.update(tweet)
  end
end

every(3.minutes, 'tweet')
