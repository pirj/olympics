ActiveAdmin.register Event do
  permit_params :title, :description, :subject, :start, :finish, :owner_id

  # TODO:
  # Contacts
  # Documents
  # State
  # Subject
  # Owner
  # Show intersections

  index do
    selectable_column
    column :title
    column :subtype do |document|
      document.subtype.text
    end
    column :subject
    column :start
    column :finish
    column :owner
    actions
  end

  filter :title
  filter :subtype
  filter :subject
  filter :description
  filter :start
  filter :finish
  filter :author
  filter :owner
  filter :created_at

  form do |event|
    event.semantic_errors
    event.semantic_errors *event.object.errors.keys
    event.inputs do
      event.input :title
      event.input :description
      event.input :subject
      event.input :start, as: :datepicker, datepicker_options: { min_date: Date.current }
      event.input :finish, as: :datepicker, datepicker_options: { min_date: Date.current }
    end
    event.actions
  end

  show do
    attributes_table do
      row :title
      row :owner
      row :subtype do |document|
        document.subtype.text
      end
      row :subject
      row :description
      row :start
      row :finish
      row :author
      row :created_at
      row :updated_at
    end
  end

  sidebar I18n.t(:documents), only: :show do
    attributes_table do
      event.documents.map do |document|
        row :document do
          # attachment_image_tag
          # image_tag attachment_url(image, :image)
        end
      end

    end
  end
end