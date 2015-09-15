require 'test_helper'

describe NewsImage do
  describe 'basic' do
    subject { build :news_image }

    it 'must have fields and associations' do
      must belong_to :news
      must have_db_column :image_id
    end
  end
end
