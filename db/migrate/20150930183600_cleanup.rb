class Cleanup < ActiveRecord::Migration
  def change
    remove_column :users, :contact_id
    add_column :users, :department, :string

    remove_column :categories, :subtype
    add_column :categories, :department, :string

    remove_column :news, :subtype
    add_column :news, :department, :string

    add_column :subjects, :department, :string

    drop_table :documents
  end
end
