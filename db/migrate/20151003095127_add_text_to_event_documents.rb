class AddTextToEventDocuments < ActiveRecord::Migration
  def change
    add_column :event_documents, :text, :text
  end
end
