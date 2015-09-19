class User < ActiveRecord::Base
  extend Enumerize

  devise :database_authenticatable

  enumerize :role, in: [:sys_admin, :ko_admin, :ko_user, :knvsh_admin, :knvsh_user, :tso_admin, :tso_user, :external_user, :none], default: :none

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..72 }
  validates :role, presence: true

  belongs_to :contact
end
