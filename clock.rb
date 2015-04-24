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

tweets = ['Gonna start', 'Start two', 'And three?', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13!', '14,', '15']

response = nil
handler do |_|
  return if tweets.empty?
  tweet = tweets.shift
  if !response.nil?
    response = client.update("@gjtorikian #{tweet}", :in_reply_to_status_id => response.id)
  else
    response = client.update(tweet)
  end
end

every(2.minutes, 'tweet')
