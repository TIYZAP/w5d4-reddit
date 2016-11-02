class Tagging < ApplicationRecord

  belongs_to :link
  belongs_to :tag

   validates_presence_of :link, :tag

end
