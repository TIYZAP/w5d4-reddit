class User < ApplicationRecord
  has_many :links
  has_secure_password
  

  # validates :username, :email_address,
  #           presence: true,
  #           uniqueness: true
  #
  # validates :email_address,
  #           format: /\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\b/
end
