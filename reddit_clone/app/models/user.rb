class User < ApplicationRecord
  has_many :links
  has_secure_password
end
