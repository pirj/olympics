class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.text :text

      t.string :subtype

      t.string :attached_document_filename
      t.string :attached_document_id

      t.timestamps null: false
    end
  end
end
