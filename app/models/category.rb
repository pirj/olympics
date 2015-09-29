class Category < ActiveRecord::Base
  extend Enumerize
  include Subtypes

  validates :title, presence: true

  # TODO: add index
  enumerize :subtype, in: SUBTYPES
  validates :subtype, presence: true, inclusion: SUBTYPES
end
