require 'test_helper'

describe Questionnaire do
  describe 'basic' do
    subject { build :questionnaire }

    it 'must have fields and associations' do
      must have_many :answers
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

  describe 'active scope' do
    before do
      create :questionnaire, ends_on: 1.day.ago
      create :questionnaire, starts_on: 1.day.since
      @current = create :questionnaire, starts_on: 1.day.ago, ends_on: 1.day.since
    end

    subject { Questionnaire.active }

    it 'fits the scope' do
      assert_equal subject, [ @current ]
    end
  end
end
