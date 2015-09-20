ActiveAdmin.register Event do
  permit_params :title, :description, :subject_id, :start, :finish, :owner_id,
    documents_attributes: [:id, :attached_document, :title, :_destroy],
    contacts_events_attributes: [:id, :contact_id, :_destroy]

  # TODO: Show intersections

  index do
    selectable_column
    column :title
    column :subtype do |document|
      document.subtype.text
    end
    column :subject
    column :aasm_state do |document|
      t(document.aasm_state, scope: %w[ aasm event state ])
    end
    column :start
    column :finish
    column :owner
    actions # FIXME: remove delete
  end

  filter :title
  filter :subtype
  filter :subject #, as: :check_boxes
  filter :aasm_state
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
      event.input :owner
      event.input :start, as: :datepicker, datepicker_options: { min_date: Date.current }
      event.input :finish, as: :datepicker, datepicker_options: { min_date: Date.current }
    end
    event.inputs do
      event.has_many :documents, allow_destroy: true, new_record: true do |document|
        document.input :title
        document.input :attached_document, as: :refile
      end
    end
    event.inputs do
      event.has_many :contacts_events, allow_destroy: true, new_record: true do |contact|
        contact.input :contact
      end
    end
    event.actions
  end

  show do
    attributes_table do
      row :title
      row :subtype do |document|
        document.subtype.text
      end
      row :subject
      row :owner
      row :aasm_state do |document|
        t(document.aasm_state, scope: %w[ aasm event state ])
      end
      row :description
      row :start
      row :finish
      row :author
      row :created_at
      row :updated_at
    end
  end

  sidebar I18n.t(:interferences), except: :index do
    attributes_table do

    end
  end

  sidebar I18n.t(:contacts), only: :show do
    event.contacts.map do |contact|
      div do
        link_to contact.name, admin_contact_path(contact)
      end
    end
  end

  sidebar I18n.t(:documents), only: :show do
    event.documents.map do |document|
      div do
        link_to document.title, attachment_url(document, :attached_document, filename: document.attached_document_filename)
      end
    end
  end

  batch_action :destroy, false
  config.remove_action_item :destroy

  member_action :publish, method: :post do
    resource.publish!
    redirect_to admin_event_path resource
  end

  action_item :publish, only: :show do
    link_to t(:publish, scope: %w[ active_admin actions labels ]), publish_admin_event_path(event), method: :post if resource.may_publish?
  end

  batch_action :publish do |ids|
    Event.where(id: ids).each do |event|
      event.publish! if event.may_publish?
    end
    redirect_to admin_events_path
  end

  member_action :unpublish, method: :post do
    resource.unpublish!
    redirect_to admin_event_path resource
  end

  action_item :unpublish, only: :show do
    link_to t(:unpublish, scope: %w[ active_admin actions labels ]), publish_admin_event_path(event), method: :post if resource.may_unpublish?
  end

  batch_action :unpublish do |ids|
    Event.where(id: ids).each do |event|
      event.unpublish! if event.may_unpublish?
    end
    redirect_to admin_events_path
  end

  member_action :archive, method: :post do
    resource.archive!
    redirect_to admin_event_path resource
  end

  action_item :archive, only: :show do
    link_to t(:archive, scope: %w[ active_admin actions labels ]), publish_admin_event_path(event), method: :post if resource.may_archive?
  end

  batch_action :archive do |ids|
    Event.where(id: ids).each do |event|
      event.archive! if event.may_archive?
    end
    redirect_to admin_events_path
  end
end
