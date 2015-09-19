require 'test_helper'

describe NewsImage do
  describe 'basic' do
    subject { build :news_image }

    it 'must have fields and associations' do
      must belong_to :news
      must have_db_column :image_id
    end

    it 'validates attributes' do
      must have_valid(:image_id).when('afgasgsag')
      # FIXME: wont have_valid(:image_id).when(nil, '')
    end
  end
end
