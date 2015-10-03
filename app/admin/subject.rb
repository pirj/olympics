ActiveAdmin.register Subject do
  permit_params :title

  controller do
    def find_resource
      scoped_collection.friendly.find_by_friendly_id(params[:id])
    end
  end

  index do
    selectable_column
    column :title
    column :department do |subject|
      subject.department.text
    end
    actions
  end

  filter :title
  filter :department
  filter :created_at

  form do |subject|
    subject.semantic_errors
    subject.semantic_errors *subject.object.errors.keys
    subject.inputs do
      subject.input :title
      subject.input :department
    end
    subject.actions
  end

  show do
    attributes_table do
      row :title
      row :department do |subject|
        subject.department.text
      end
      row :created_at
      row :updated_at
    end
  end
end
