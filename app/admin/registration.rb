ActiveAdmin.register Registration do
  index do
    selectable_column
    column :email
    column :name
    column :created_at
    actions defaults: false do |registration|
      span item t('active_admin.view'), resource_path(registration)
      span item t('active_admin.delete'), resource_path(registration), method: :delete
    end
  end

  filter :email
  filter :name
  filter :created_at

  # FIXME: use a better way to disallow editing
  form do
  end

  show do |faq|
    attributes_table do
      row :email
      row :name
      row :note
      row :created_at
      row :updated_at
    end
  end
end

