class Vote < ActiveRecord::Base
  belongs_to :answer #, counter_cache: true
  validates :answer, presence: true
end
