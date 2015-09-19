class AddImageToContacts < ActiveRecord::Migration
  def change
    change_table :contacts do |t|
      t.string :image_id
    end
  end
end
