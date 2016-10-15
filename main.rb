require_relative 'init'
require 'sinatra/base'

class Main < Sinatra::Application

  # It's for auto reloading the ruby files under your LIB_DIR when you make any
  # changes to them in development mode, so that you don't have to restart your
  # dev server.
  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
    Dir.glob(File.join(LIB_DIR, '**', '*.rb')) do |file|
      also_reload file
    end
  end

  get '/' do
    "hello"
  end

end

