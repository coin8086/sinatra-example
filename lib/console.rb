# The lib is solely for "rake console"

require_relative '../init'
require 'pp' # For pretty print
require 'sinatra/activerecord'
require 'models'

# Turn on log for development mode
if ENV['RACK_ENV'] == 'development'
  ActiveRecord::Base.logger = Logger.new(STDERR)
  ActiveRecord::Base.logger.level = Logger::DEBUG
end

