require 'test_helper'

describe NewsEntryImage do
  describe 'basic' do
    subject { build :news_entry_image }

    it 'must have fields and associations' do
      must belong_to :news_entry
      must have_db_column :image_id
    end
  end
end
