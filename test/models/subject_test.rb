require 'test_helper'

describe Subject do
  describe 'basic' do
    subject { build :subject }

    it 'must have fields and associations' do
      must have_db_column :title
      must have_db_column :department
    end

    it 'validates attributes' do
      must have_valid(:title).when('Математика')
      wont have_valid(:title).when(nil, '')

      must have_valid(:department).when(:ko, :knvsh, :tso, :none)
      wont have_valid(:department).when(nil, '', :lol)
      must validate_inclusion_of(:department).in_array %w(ko knvsh tso none)
    end
  end
end
