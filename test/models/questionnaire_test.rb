require 'test_helper'

describe Questionnaire do
  subject { build :questionnaire }

  it 'must have fields and associations' do
    must have_many :questions
    must have_db_column :starts_on
    must have_db_column :ends_on
    must have_db_column :title
  end

  it 'validates attributes' do
    must have_valid(:title).when('Hello')
    wont have_valid(:title).when(nil, '')
    must have_valid(:starts_on).when(Date.today)
    wont have_valid(:starts_on).when(nil)
    must have_valid(:ends_on).when(Date.today)
    wont have_valid(:ends_on).when(nil)
  end
end
