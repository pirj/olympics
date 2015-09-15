class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.references :author
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
