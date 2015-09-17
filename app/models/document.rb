class Document < ActiveRecord::Base
  extend Enumerize

  # TODO: add index
  enumerize :subtype, in: [:federal, :regional, :rsosh, :science]
  validates :subtype, presence: true

  attachment :attached_document # FIXME: # , type: :document
  validates :attached_document, presence: true

  validates :title, presence: true

  scope :by_subtypes, -> subtypes { where(subtype: subtypes) }
  scope :by_name, -> name { where('title LIKE ? or text LIKE ?', *(["%#{name}%"]*2)) }
end
