class CreateNewsEntryImages < ActiveRecord::Migration
  def change
    create_table :news_entry_images do |t|
      t.references :news_entry
      t.string :image_id

      t.timestamps null: false
    end
  end
end
