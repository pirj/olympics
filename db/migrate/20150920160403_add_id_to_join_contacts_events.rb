class AddIdToJoinContactsEvents < ActiveRecord::Migration
  def change
    drop_table :contacts_events
    create_table :contacts_events do |t|
      t.references :contact, index: true
      t.references :event, index: true
    end
  end
end
