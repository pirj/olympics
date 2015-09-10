ActiveAdmin.register NewsEntry do
  permit_params :title, :text,
    images_attributes: [:id, :image, :_destroy]

  index do
    selectable_column
    column :title
    column :created_at
    actions
  end

  filter :title
  filter :created_at

  form do |entry|
    entry.semantic_errors # *questionnaire.object.errors.keys
    entry.semantic_errors *entry.object.errors.keys
    entry.inputs do
      entry.input :title
      entry.input :text
    end
    entry.inputs do
      entry.has_many :images, allow_destroy: true, new_record: true do |image|
        image.input :image, as: :refile
      end
    end
    entry.actions
  end

  show do
    attributes_table do
      row :title
      row :text
      row :created_at
      row :updated_at
    end
  end

  sidebar I18n.t(:images), only: :show do
    attributes_table do
      news_entry.images.map do |image|
        row :image do
          # attachment_image_tag
          image_tag attachment_url(image, :image, format: "jpg")
        end
      end
    end
  end
end
