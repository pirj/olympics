class Link < ActiveRecord::Base
  attachment :image, type: :image
  validates :image, presence: true

  validates :title, presence: true
  validates :url, presence: true
end
