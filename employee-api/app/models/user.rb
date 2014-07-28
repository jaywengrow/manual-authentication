class User < ActiveRecord::Base
  has_many :api_key
end
