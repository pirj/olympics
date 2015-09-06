require 'test_helper'

describe Question do
  subject { build :question }

  it 'must have fields and associations' do
    must have_many :answers
    must belong_to :questionnaire
    must have_db_column :title
  end

  it 'validates attributes' do
    must have_valid(:title).when('Hello')
    wont have_valid(:title).when(nil, '')
  end
end
