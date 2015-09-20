class AddSectionTextsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :excercise, :text
    add_column :events, :resolution, :text
  end
end
