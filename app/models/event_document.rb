class EventDocument < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :event
  validates :event, presence: true

  attachment :attached_document, type: :document
  validates :attached_document, presence: true
end
