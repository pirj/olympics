ActiveAdmin.register Category do
  permit_params :title, :subtype

  index do
    selectable_column
    column :title
    column :subtype do |document|
      document.subtype.text
    end
    column :created_at
    actions
  end

  filter :title
  filter :subtype
  filter :created_at

  form do |item|
    item.semantic_errors
    item.semantic_errors *item.object.errors.keys
    item.inputs do
      item.input :title
      item.input :subtype
    end
    item.actions
  end

  show do
    attributes_table do
      row :title
      row :subtype do |document|
        document.subtype.text
      end
      row :created_at
      row :updated_at
    end
  end
end
