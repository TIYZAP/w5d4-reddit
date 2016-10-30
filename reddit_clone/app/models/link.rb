class Link < ApplicationRecord
  belongs_to :user, required: false
end
