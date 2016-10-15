# The lib is solely for "rake console"

require_relative '../init'
require 'sinatra/activerecord'
require 'pp' # For pretty print

# Turn on log for development mode
if ENV['RACK_ENV'] == 'development'
  ActiveRecord::Base.logger = Logger.new(STDERR)
  ActiveRecord::Base.logger.level = Logger::ERROR
end

