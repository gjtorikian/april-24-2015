#!/usr/bin/env ruby

tweets_file = File.read('tweets.txt')

tweets = []
tweets_file.split("\n").each_with_index do |tweet, i|
  tweets << "#{i + 1}. #{tweet} #ArmenianGenocide"
end

too_long = tweets.select { |t| t.length > 140 }

puts too_long
