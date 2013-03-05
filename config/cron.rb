require 'clockwork'
require 'rest_client'

include Clockwork

Clockwork.configure do |config|
  config[:logger] = Logger.new(STDOUT)
  config[:logger].level = Logger::ERROR
  config[:tz] = ENV['SERVICENARC_SENDMAIL_TZ']
end

handler do |job|
  puts "Running #{job}"
end

every(1.day, 'send.email', :at => ENV['SERVICENARC_SENDMAIL_TIME'], :tz => ENV['SERVICENARC_SENDMAIL_TZ']) do
  raw = RestClient.get('http://' + ENV['SERVICENARC_DOMAIN_NAME'] + '/sendmail')
end