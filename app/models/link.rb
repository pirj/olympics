class Link < ActiveRecord::Base
  attachment :image, type: :image
  validates :image, presence: true
end
