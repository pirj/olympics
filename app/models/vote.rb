class Vote < ActiveRecord::Base
  belongs_to :answer #, counter_cache: true
  validates :answer_id, presence: true
end
