class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true, email_format: true
  validates :organization, presence: true
  validates :position, presence: true

  has_many :in_charge, class_name: 'Event'

  has_one :user
end
