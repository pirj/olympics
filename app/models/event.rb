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

  has_many :info_documents, -> { where section: :info }, class_name: 'EventDocument'
  accepts_nested_attributes_for :info_documents, allow_destroy: true

  has_many :excercise_documents, -> { where section: :excercise }, class_name: 'EventDocument'
  accepts_nested_attributes_for :excercise_documents, allow_destroy: true

  has_many :resolution_documents, -> { where section: :resolution }, class_name: 'EventDocument'
  accepts_nested_attributes_for :resolution_documents, allow_destroy: true

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
end
