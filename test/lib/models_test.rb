require_relative '../test_helpers'
require 'models'
require 'rack/test'

class ModelsTest < Minitest::Test
  include TestHelpers

  def test_user_email_address
    init(
      :users => [
        { :id => 1, :name => 'Bob', :email => 'bob@abc.com' }
      ]
    )
    user = M::User.find 1
    assert_equal "Bob <bob@abc.com>", user.email_address
  end

end


