class AddTypeToNews < ActiveRecord::Migration
  def change
    add_column :news, :subtype, :string
  end
end
