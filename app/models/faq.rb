class Faq < ActiveRecord::Base
  include CaseSensivity

  validates :question, presence: true

  scope :by_text, -> text { where("question #{LIKE} ? or answer #{LIKE} ?", *(["%#{text}%"]*2)) }
end
