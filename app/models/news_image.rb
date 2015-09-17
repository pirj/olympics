class NewsImage < ActiveRecord::Base
  belongs_to :news
  attachment :image, type: :image
  validates :image, presence: true
end
