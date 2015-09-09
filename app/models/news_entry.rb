class NewsEntry < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :images, class_name: 'NewsEntryImage'

  scope :actual, -> (count) { limit(count).order(created_at: :desc) }
end
