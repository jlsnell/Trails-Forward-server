class User < ActiveRecord::Base
  versioned
  has_many :players
end
