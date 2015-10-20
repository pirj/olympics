class Subject < ActiveRecord::Base
  extend ActiveNull
  extend Enumerize
  include Departments
  include FriendlyId

  friendly_id :title
  null_model

  # TODO: add index
  enumerize :department, in: DEPARTMENTS, default: :none
  validates :department, presence: true, inclusion: DEPARTMENTS

  validates :title, presence: true
end
