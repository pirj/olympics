class NewsEntry < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :images, class_name: 'NewsEntryImage'
  accepts_nested_attributes_for :images, allow_destroy: true

  scope :actual, -> (count) { limit(count).order(created_at: :desc) }
end