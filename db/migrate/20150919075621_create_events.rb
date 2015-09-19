class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description, null: false

      t.date :start, null: false
      t.date :finish, null: false

      t.string :subtype, null: false

      t.references :author, index: true
      t.references :owner, index: true

      t.references :subject, index: true

      t.boolean :external, null: false
      t.string :aasm_state, null: false

      t.timestamps null: false
    end
  end
end
