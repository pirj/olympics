ActiveAdmin.register Questionnaire do
  permit_params :title, :starts_on, :ends_on,
    answers_attributes: [:id, :title, :_destroy]

  index do
    selectable_column
    column :title
    column :starts_on
    column :ends_on
    column :created_at
    actions
  end

  filter :title
  filter :starts_on
  filter :ends_on
  filter :created_at

  form do |questionnaire|
    questionnaire.semantic_errors
    questionnaire.semantic_errors *questionnaire.object.errors.keys
    questionnaire.inputs do
      questionnaire.input :title
      questionnaire.input :starts_on, as: :datepicker, datepicker_options: { min_date: Date.current }
      questionnaire.input :ends_on, as: :datepicker, datepicker_options: { min_date: Date.current }
    end
    questionnaire.inputs do
      questionnaire.has_many :answers, allow_destroy: true, new_record: true do |answer|
        answer.semantic_errors *answer.object.errors.keys
        answer.input :title
      end
    end
    questionnaire.actions
  end

  show do
    attributes_table do
      row :title
      row :starts_on
      row :ends_on
      row :created_at
      row :updated_at
    end
  end
end
