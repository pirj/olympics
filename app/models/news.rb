class News < ActiveRecord::Base
  extend Enumerize
  include Departments

  belongs_to :author, class_name: 'User'
  validates :author, presence: true

  belongs_to :category
  validates :category, presence: true

  validates :title, :text, presence: true

  has_many :images, class_name: 'NewsImage'
  accepts_nested_attributes_for :images, allow_destroy: true

  scope :actual, -> (count) { limit(count).order(created_at: :desc) }
end
