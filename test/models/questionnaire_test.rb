require 'test_helper'

describe Questionnaire do
  describe 'basic' do
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

  describe 'active scope' do
    let(:passed) { create :questionnaire, ends_on: 1.day.ago }
    let(:future) { create :questionnaire, starts_on: 1.day.since }
    let(:current) { create :questionnaire, starts_on: 1.day.ago, ends_on: 1.day.since }
    it 'fits the scope' do
      active = Questionnaire.active
      refute_empty active
      assert_equal 1, active.length
      assert_equal current, active.first
    end
  end
end
