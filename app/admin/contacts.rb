ActiveAdmin.register Contact do
  permit_params :name, :phone, :email, :organization, :position, :image

  index do
    selectable_column
    # id_column
    column :name
    column :phone
    column :email
    column :organization
    column :position
    actions
  end

  filter :name
  filter :phone
  filter :email
  filter :organization
  filter :position

  form do |contact|
    contact.semantic_errors
    contact.semantic_errors *contact.object.errors.keys
    contact.inputs do
      contact.input :name
      contact.input :phone
      contact.input :email
      contact.input :organization
      contact.input :position
      contact.input :image, as: :refile
    end
    contact.actions
  end

  show do
    attributes_table do
      row :name
      row :phone
      row :email
      row :organization
      row :position
    end
  end

  sidebar I18n.t(:images), only: :show do
    attributes_table do
      row :image do
        # attachment_image_tag
        image_tag attachment_url(contact, :image, :fit, 300, 300)
      end
    end
  end
end
