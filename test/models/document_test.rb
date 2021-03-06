require 'test_helper'

describe Document do
  describe 'basic' do
    subject { build :document }

    it 'must have fields and associations' do
      must have_db_column :title
      must have_db_column :text
      must have_db_column :attached_document_id
      must have_db_column :attached_document_filename
      must have_db_column :attached_document_content_type
      must have_db_column :attached_document_size
      must have_db_column :subtype
    end

    it 'validates attributes' do
      must have_valid(:title).when('asd  asd asd ')
      wont have_valid(:title).when(nil, '')
      must have_valid(:attached_document_id).when('afgasgsag')
      # FIXME: wont have_valid(:attached_document_id).when(nil, '')
      must have_valid(:subtype).when(:federal, :regional, :rsosh, :science)
      wont have_valid(:subtype).when(nil, '', :lol)
      must validate_inclusion_of(:subtype).in_array %w(federal regional rsosh science)
    end
  end
end
