class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :subtype
      t.string :title

      t.timestamps null: false
    end

    add_column :events, :category_id, :integer
  end
end
