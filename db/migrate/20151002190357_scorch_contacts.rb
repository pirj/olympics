class ScorchContacts < ActiveRecord::Migration
  def change
    drop_table :contacts_events
    drop_table :contacts

    remove_column :events, :owner_id

    create_table :contacts do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :additional_phone, null: false
      t.string :email, null: false
      t.string :organization, null: false
      t.string :position, null: false
      t.string :image_id

      t.references :event, index: true

      t.timestamps null: false
    end
  end
end
