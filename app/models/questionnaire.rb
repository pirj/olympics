class Questionnaire < ActiveRecord::Base
  has_many :questions
  accepts_nested_attributes_for :questions

  validates :title, presence: true
  validates :starts_on, presence: true
  validates :ends_on, presence: true
end
