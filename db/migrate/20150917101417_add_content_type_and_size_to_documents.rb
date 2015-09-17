class AddContentTypeAndSizeToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :attached_document_size, :integer
    add_column :documents, :attached_document_content_type, :string
  end
end
