class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :email
      t.string :name
      t.string :note

      t.timestamps null: false
    end
  end
end
