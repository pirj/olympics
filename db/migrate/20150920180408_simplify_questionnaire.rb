class SimplifyQuestionnaire < ActiveRecord::Migration
  def change
    drop_table :questions
    remove_column :answers, :question_id

    change_table :answers do |t|
      t.references :questionnaire, index: true
    end
  end
end
