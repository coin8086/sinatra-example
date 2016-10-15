require_relative 'test_helpers'
require_relative '../main'
require 'rack/test'

class MainTest < Minitest::Test
  include Rack::Test::Methods
  include TestHelpers

  def app
    Main
  end

  def test_index
    # It should be OK to get '/'.
    get '/'
    assert last_response.ok?
  end

end

