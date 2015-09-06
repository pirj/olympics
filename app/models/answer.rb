class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :votes

  validates :title, presence: true
  validates :question_id, presence: true
end
