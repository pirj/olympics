class Questionnaire < ActiveRecord::Base
  has_many :questions
  accepts_nested_attributes_for :questions, allow_destroy: true

  # scope :active, -> { where { ends_on >= Date.current }.where { starts_on <= Date.current } }
  scope :active, -> { where("ends_on >= ?", Date.current).where(" starts_on <= ?", Date.current) }

  validates :title, presence: true
  validates :starts_on, presence: true
  validates :ends_on, presence: true
end
