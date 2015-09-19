ActiveAdmin.register Link do
  permit_params :title, :url, :image

  index do
    selectable_column
    column :title
    column :url
    column :created_at
    actions
  end

  filter :title
  filter :url
  filter :created_at

  form do |link|
    link.semantic_errors
    link.semantic_errors *link.object.errors.keys
    link.inputs do
      link.input :title
      link.input :url
      link.input :image, as: :refile
    end
    link.actions
  end

  show do |external_link|
    attributes_table do
      row :title
      row :url
      row :image do
        image_tag attachment_url(external_link, :image, :fit, 300, 300)
      end
      row :created_at
      row :updated_at
    end
  end
end
