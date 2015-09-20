class EventDocument < ActiveRecord::Base
  extend Enumerize

  enumerize :section, in: [:info, :excercise, :resolution], scope: true
  validates :section, presence: true

  validates :title, presence: true

  belongs_to :event
  validates :event, presence: true

  attachment :attached_document, type: :document
  validates :attached_document, presence: true
end
