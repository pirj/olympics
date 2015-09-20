class AddSectionToEventDocument < ActiveRecord::Migration
  def change
    add_column :event_documents, :section, :string
  end
end
