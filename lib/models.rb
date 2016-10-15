require 'active_record'

module M
  class User < ActiveRecord::Base
    def email_address
      "#{name} <#{email}>"
    end

  end

end
