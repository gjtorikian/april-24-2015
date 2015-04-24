#!/usr/bin/env ruby

tweets_file = File.read('tweets.txt')

tweets = []
tweets_file.split("\n").each_with_index.map do |tweet, i|
  if i > 0
    tweets << "@gjtorikian #{i + 1}. #{tweet}"
  else
    tweets << "#{i + 1}. #{tweet}"
  end
end

too_long = tweets.select { |t| t.length > 140 }

puts too_long
