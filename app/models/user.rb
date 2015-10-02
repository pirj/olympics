class User < ActiveRecord::Base
  extend Enumerize
  include Departments

  devise :database_authenticatable

  enumerize :role, in: [:super_admin, :admin, :none], default: :none
  enumerize :department, in: DEPARTMENTS, default: :none

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..72 }
  validates :role, presence: true
  validates :department, presence: true, inclusion: DEPARTMENTS
end
