require 'test_helper'

describe Category do
  describe 'basic' do
    subject { build :category }

    it 'must have fields and associations' do
      must have_db_column :title
      must have_db_column :department
    end

    it 'validates attributes' do
      must have_valid(:title).when('asd  asd asd ')
      wont have_valid(:title).when(nil, '')

      must have_valid(:department).when(:ko, :knvsh, :tso, :none)
      wont have_valid(:department).when(nil, '', :lol)
      must validate_inclusion_of(:department).in_array %w(ko knvsh tso none)
    end
  end
end
