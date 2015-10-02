class EventDocument < ActiveRecord::Base
  extend Enumerize

  enumerize :section, in: [:info, :excercise, :resolution], scope: true
  validates :section, presence: true

  validates :title, presence: true

  belongs_to :event
  # FIXME: use index instead, this suck
  validates :event, presence: true, unless: :new_record?

  attachment :attached_document, type: :document
  validates :attached_document, presence: true

  scope :by_subtypes, -> subtypes { where(event: { subtype: subtypes } ) }
  scope :by_name, -> name { where('title LIKE ? or text LIKE ?', *(["%#{name}%"]*2)) }
end
