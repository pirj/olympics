class Registration < ActiveRecord::Base
  validates :email, :name, :note, presence: true
  validates_email_format_of :email
end
