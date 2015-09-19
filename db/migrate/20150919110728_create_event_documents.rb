class CreateEventDocuments < ActiveRecord::Migration
  def change
    create_table :event_documents do |t|
      t.string :title

      t.references :event

      t.string :attached_document_id
      t.string :attached_document_filename
      t.string :attached_document_content_type
      t.integer :attached_document_size

      t.timestamps null: false
    end
  end
end
