class Cleanup < ActiveRecord::Migration
  def change
    add_column :users, :department, :string

    remove_column :categories, :subtype
    add_column :categories, :department, :string

    remove_column :news, :subtype
    add_column :news, :department, :string

    add_column :subjects, :department, :string
  end
end
