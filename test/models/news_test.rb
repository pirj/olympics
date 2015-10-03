require 'test_helper'

describe News do
  describe 'basic' do
    subject { build :news }

    it 'must have fields and associations' do
      must belong_to :author
      must have_many :images
      must have_db_column :title
      must have_db_column :text
      must have_db_column :created_at
      must have_db_column :department
    end

    it 'validates attributes' do
      must have_valid(:title).when('asd  asd asd ')
      wont have_valid(:title).when(nil, '')
      must have_valid(:text).when('asd  asd asd ')
      wont have_valid(:text).when(nil, '')

      must have_valid(:department).when(:ko, :knvsh, :tso, :none)
      wont have_valid(:department).when(nil, '', :lol)
      must validate_inclusion_of(:department).in_array %w(ko knvsh tso none)
    end
  end

  describe 'scopes' do
    before do
      (1..5).each do |days|
        create :news, created_at: days.day.ago
      end
    end

    subject { News.actual(3) }

    it 'fits the scope' do
      assert_equal 3, subject.count
      assert_in_delta 1.day.ago, subject.first.created_at, 2.seconds
      assert_in_delta 2.day.ago, subject.second.created_at, 2.seconds
      assert_in_delta 3.day.ago, subject.third.created_at, 2.seconds
    end
  end
end
