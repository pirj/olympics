class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :organization, presence: true
  validates :position, presence: true

  has_many :in_charge, class: 'Event'
end
