class Question < ActiveRecord::Base
  belongs_to :questionnaire
  has_many :answers

  validates :title, presence: true
  validates :questionnaire_id, presence: true
end
