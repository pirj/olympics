require 'test_helper'

describe Answer do
  subject { build :answer }

  it 'must have fields and associations' do
    must have_many :votes
    must belong_to :questionnaire
    must have_db_column :title
  end

  it 'validates attributes' do
    must have_valid(:title).when('Hello')
    wont have_valid(:title).when(nil, '')
    # must have_valid(:questionnaire_id).when(1)
    # wont have_valid(:questionnaire_id).when(nil)
  end
end
