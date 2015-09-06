class Question < ActiveRecord::Base
  belongs_to :questionnaire
  has_many :answers
  accepts_nested_attributes_for :answers

  validates :title, presence: true
  validates :questionnaire_id, presence: true
end
