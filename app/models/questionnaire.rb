class Questionnaire < ActiveRecord::Base
  has_many :questions

  validates :title, presence: true
  validates :starts_on, presence: true
  validates :ends_on, presence: true
end
