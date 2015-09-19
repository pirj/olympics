require 'test_helper'

describe Subject do
  describe 'basic' do
    subject { build :subject }

    it 'must have fields and associations' do
      must have_db_column :title
    end

    it 'validates attributes' do
      must have_valid(:title).when('Математика')
      wont have_valid(:title).when(nil, '')
    end
  end
end
