ActiveAdmin.register Document do
  permit_params :title, :text, :subtype, :attached_document

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
      item.input :text
      item.input :attached_document, as: :refile
    end
    item.actions
  end

  show do
    attributes_table do
      row :title
      row :subtype do |document|
        document.subtype.text
      end
      row :text
      row :attached_document do |document|
        link_to document.attached_document_filename, attachment_url(document, :attached_document, filename: document.attached_document_filename)
      end
      row :attached_document_size
      row :attached_document_content_type
      row :created_at
      row :updated_at
    end
  end
end
