class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :organization, null: false
      t.string :position, null: false

      t.timestamps null: false
    end
  end

  create_table :contacts_events, id: false do |t|
    t.references :contact, index: true
    t.references :event, index: true
  end

  change_table :users do |t|
    t.references :contacts, index: true
  end
end
