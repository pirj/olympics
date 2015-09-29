require 'test_helper'

describe Category do
  describe 'basic' do
    subject { build :category }

    it 'must have fields and associations' do
      must have_db_column :title
      must have_db_column :subtype
    end

    it 'validates attributes' do
      must have_valid(:title).when('asd  asd asd ')
      wont have_valid(:title).when(nil, '')
      must have_valid(:subtype).when(:federal, :regional, :rsosh, :science)
      wont have_valid(:subtype).when(nil, '', :lol)
      must validate_inclusion_of(:subtype).in_array %w(federal regional rsosh science)
    end
  end
end
