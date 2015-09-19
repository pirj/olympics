class Event < ActiveRecord::Base
  extend Enumerize
  include Subtypes

  validates :title, presence: true
  validates :description, presence: true

  validates :start, presence: true
  validates :finish, presence: true

  # TODO: add index
  enumerize :subtype, in: SUBTYPES
  validates :subtype, presence: true

  belongs_to :author, class_name: 'User'
  validates :author, presence: true

  belongs_to :owner, class_name: 'User'
  validates :owner, presence: true

  def owner_contact
    owner.contact
  end

  has_and_belongs_to_many :contacts
end
