class Link < ApplicationRecord
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings


  def tag_names
    tags.collect(&:name).join(", ")
  end
end
