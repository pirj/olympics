class Contact < ActiveRecord::Base
  attachment :image, type: :image

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates_email_format_of :email
  validates :organization, presence: true
  validates :position, presence: true

  has_many :in_charge, class_name: 'Event'

  has_one :user
end
