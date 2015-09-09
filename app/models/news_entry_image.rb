class NewsEntryImage < ActiveRecord::Base
  belongs_to :news_entry
  attachment :image
end
