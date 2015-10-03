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

  belongs_to :category
  validates :category, presence: true

  belongs_to :author, class_name: 'User'
  validates :author, presence: true

  belongs_to :subject

  has_many :contacts
  accepts_nested_attributes_for :contacts, allow_destroy: true

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

  def intersections
    Event.where('NOT (id = ?) AND start <= ? AND finish >= ?', id, finish, start)
  end

  scope :internal_only, -> { where external: false }

  scope :year, -> year { where 'start >= ? AND finish <= ?', Time.new(year), Time.new(year).end_of_year }
  scope :month, -> month { where "EXTRACT(MONTH FROM start) = ?", month } if Rails.env.production?
  scope :month, -> month { where "strftime('%m', start) = ?", month.to_s.rjust(2, '0') } unless Rails.env.production?
  scope :text, -> text { where('title LIKE ? or description LIKE ?', *(["%#{text}%"]*2)) }

  scope :by_subtypes, -> subtypes { where subtype: subtypes }
  scope :by_subjects, -> subjects { joins(:subject).where(subjects: { title: subjects }) }
end
