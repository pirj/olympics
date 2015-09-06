class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :questionnaire
      t.string :title
    end
  end
end
