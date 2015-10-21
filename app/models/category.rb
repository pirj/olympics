class Category < ActiveRecord::Base
  extend ActiveNull
  extend Enumerize
  include Departments

  null_model

  validates :title, presence: true

  # TODO: add index
  enumerize :department, in: DEPARTMENTS, default: :none
  validates :department, presence: true, inclusion: DEPARTMENTS
end
