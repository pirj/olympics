class Document < ActiveRecord::Base
  extend Enumerize

  # TODO: add index
  enumerize :subtype, in: [:federal, :regional, :rsosh, :science]
  validates :subtype, presence: true

  attachment :attached_document # FIXME: # , type: :document
  validates :attached_document, presence: true

  validates :title, presence: true
end
