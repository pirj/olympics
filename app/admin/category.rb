ActiveAdmin.register Category do
  permit_params :title, :department

  index do
    selectable_column
    column :title
    column :department do |category|
      category.department.text
    end
    column :created_at
    actions
  end

  filter :title
  filter :department
  filter :created_at

  form do |item|
    item.semantic_errors
    item.semantic_errors *item.object.errors.keys
    item.inputs do
      item.input :title
      item.input :department
    end
    item.actions
  end

  show do
    attributes_table do
      row :title
      row :department do |category|
        category.department.text
      end
      row :created_at
      row :updated_at
    end
  end
end
