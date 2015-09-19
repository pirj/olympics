ActiveAdmin.register Subject do
  permit_params :title

  index do
    selectable_column
    column :title
    actions
  end

  filter :title
  filter :created_at

  form do |subject|
    subject.semantic_errors
    subject.semantic_errors *subject.object.errors.keys
    subject.inputs do
      subject.input :title
    end
    subject.actions
  end

  show do
    attributes_table do
      row :title
      row :created_at
      row :updated_at
    end
  end
end
