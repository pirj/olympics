class User < ActiveRecord::Base
  devise :database_authenticatable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..72 }
end
