class Answer < ActiveRecord::Base
  belongs_to :questionnaire
  has_many :votes

  validates :title, presence: true
  validates :questionnaire, presence: true
end
