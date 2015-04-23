require 'rubygems'
require 'clockwork'
require 'twitter'
include Clockwork

# client = Twitter::REST::Client.new do |config|
#   config.consumer_key        = ENV["42415_TWITTER_CONSUMER_KEY"]
#   config.consumer_secret     = ENV["42415_TWITTER_CONSUMER_SECRET"]
#   config.access_token        = ENV["42415_TWITTER_ACCESS_TOKEN"]
#   config.access_token_secret = ENV["42415_TWITTER_ACCESS_SECRET"]
# end

handler do |job|
  puts 'Hi there.'
end
every(5.minutes, 'job_name')
