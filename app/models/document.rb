class Document < ActiveRecord::Base
  extend Enumerize
  include Subtypes
  include CaseSensivity

  # TODO: add index
  enumerize :subtype, in: SUBTYPES
  validates :subtype, presence: true, inclusion: SUBTYPES

  attachment :attached_document, type: :document
  validates :attached_document, presence: true

  validates :title, presence: true

  scope :by_subtypes, -> subtypes { where(subtype: subtypes) }
  scope :by_name, -> name { where("title #{LIKE} ? or text #{LIKE} ?", *(["%#{name}%"]*2)) }
end
