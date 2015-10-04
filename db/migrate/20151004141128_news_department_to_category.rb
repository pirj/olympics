class NewsDepartmentToCategory < ActiveRecord::Migration
  def change
    remove_column :news, :department
    add_column :news, :category_id, :string
  end
end
