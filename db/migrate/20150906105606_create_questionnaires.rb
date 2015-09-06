class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.text :title
      t.date :starts_on, nullable: false
      t.date :ends_on, nullable: false

      t.timestamps null: false
    end
  end
end
