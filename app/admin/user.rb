ActiveAdmin.register User do
  permit_params :username, :email, :password

  index do
    selectable_column
    # id_column
    column :email
    column :username
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :username
  filter :role
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :username
      f.input :password
      f.input :role
    end
    f.actions
  end

  show do
    attributes_table do
      row :email
      row :username
      row :role do |user|
        user.role.text
      end
      row :created_at
      row :updated_at
    end
  end
end
