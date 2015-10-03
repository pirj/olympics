ActiveAdmin.register News do
  permit_params :title, :text, :department,
    images_attributes: [:id, :image, :_destroy]

  index do
    selectable_column
    column :title
    column :department do |item|
      item.department.text
    end
    column :created_at
    actions
  end

  filter :title
  filter :department
  filter :created_at

  before_save do |item|
    item.author = current_user
  end

  form do |item|
    item.semantic_errors
    item.semantic_errors *item.object.errors.keys
    item.inputs do
      item.input :title
      item.input :department
      item.input :text
    end
    item.inputs do
      item.has_many :images, allow_destroy: true, new_record: true do |image|
        image.input :image, as: :refile
      end
    end
    item.actions
  end

  show do
    attributes_table do
      row :title
      row :department
      row :department do |item|
        item.department.text
      end
      row :text
      row :created_at
      row :updated_at
    end
  end

  sidebar I18n.t(:images), only: :show do
    attributes_table do
      news.images.map do |image|
        row :image do
          # attachment_image_tag
          image_tag attachment_url(image, :image)
        end
      end
    end
  end
end
