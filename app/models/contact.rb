class Contact < ActiveRecord::Base
  belongs_to :event

  attachment :image, type: :image

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates_email_format_of :email
  validates :organization, presence: true
  validates :position, presence: true

  scope :by_text, -> text { where('name LIKE ? or organization LIKE ? or position LIKE ?', *(["%#{text}%"]*3)) }

  scope :by_subtypes, -> subtypes { joins(:event).where(events: { subtype: subtypes } ) }
  scope :by_subjects, -> subjects { joins(event: :subject).where( subjects: { title: subjects } ) }
end
