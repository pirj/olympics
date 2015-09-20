class Event < ActiveRecord::Base
  extend Enumerize
  include Subtypes
  include AASM

  validates :title, presence: true
  validates :description, presence: true

  validates :start, presence: true
  validates :finish, presence: true

  # TODO: add index
  enumerize :subtype, in: SUBTYPES
  validates :subtype, presence: true, inclusion: SUBTYPES

  belongs_to :author, class_name: 'User'
  validates :author, presence: true

  belongs_to :owner, class_name: 'Contact'
  validates :owner, presence: true

  belongs_to :subject

  has_many :contacts_events
  accepts_nested_attributes_for :contacts_events, allow_destroy: true
  has_many :contacts, through: :contacts_events

  aasm do
    state :draft, initial: true
    state :published
    state :archived

    event :publish do
      transitions from: :draft, to: :published
    end

    event :unpublish do
      transitions from: :published, to: :draft
    end

    event :archive do
      transitions from: [:published, :draft], to: :archived
    end
  end

  has_many :documents, class_name: 'EventDocument'
  accepts_nested_attributes_for :documents, allow_destroy: true
end
