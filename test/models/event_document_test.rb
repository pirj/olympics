require 'test_helper'

describe Document do
  describe 'basic' do
    subject { build :event_document }

    it 'must have fields and associations' do
      must belong_to :event
      must have_db_column :title
      must have_db_column :attached_document_id
      must have_db_column :attached_document_filename
      must have_db_column :attached_document_content_type
      must have_db_column :attached_document_size
    end

    it 'validates attributes' do
      must have_valid(:title).when('asd  asd asd ')
      wont have_valid(:title).when(nil, '')
      must have_valid(:attached_document_id).when('afgasgsag')
      # FIXME: wont have_valid(:attached_document_id).when(nil, '')
    end
  end
end
