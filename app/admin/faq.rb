ActiveAdmin.register Faq do
  permit_params :question, :answer

  index do
    selectable_column
    column :question
    column :answer
    column :created_at
    actions
  end

  filter :question
  filter :answer
  filter :created_at

  form do |faq|
    faq.semantic_errors
    faq.semantic_errors *faq.object.errors.keys
    faq.inputs do
      faq.input :question
      faq.input :answer
    end
    faq.actions
  end

  show do |faq|
    attributes_table do
      row :question
      row :answer
      row :created_at
      row :updated_at
    end
  end
end
