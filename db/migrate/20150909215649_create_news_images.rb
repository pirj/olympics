class CreateNewsImages < ActiveRecord::Migration
  def change
    create_table :news_images do |t|
      t.references :news
      t.string :image_id

      t.timestamps null: false
    end
  end
end
