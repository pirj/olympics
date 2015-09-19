class News < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  validates :author, presence: true

  has_many :images, class_name: 'NewsImage'
  accepts_nested_attributes_for :images, allow_destroy: true

  scope :actual, -> (count) { limit(count).order(created_at: :desc) }
end
