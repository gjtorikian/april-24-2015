require 'rubygems'
require 'clockwork'
include Clockwork
handler do |job|
  puts 'Hi there.'
end
every(1.day, 'job_name')
