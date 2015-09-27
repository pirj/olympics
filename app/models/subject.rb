class Subject < ActiveRecord::Base
  include FriendlyId
  friendly_id :title

  validates :title, presence: true
end
