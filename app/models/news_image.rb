class NewsImage < ActiveRecord::Base
  belongs_to :news
  attachment :image
end
