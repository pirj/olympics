class Category < ActiveRecord::Base
  extend Enumerize
  include Departments

  validates :title, presence: true

  # TODO: add index
  enumerize :department, in: DEPARTMENTS, default: :none
  validates :department, presence: true, inclusion: DEPARTMENTS
end
