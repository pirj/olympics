ActiveAdmin.register Event do
  permit_params :title, :description, :subtype, :external, :excercise, :resolution, :subject_id, :start, :finish, :category_id,
    info_documents_attributes: [:id, :attached_document, :section, :title, :_destroy],
    excercise_documents_attributes: [:id, :attached_document, :section, :title, :_destroy],
    resolution_documents_attributes: [:id, :attached_document, :section, :title, :_destroy],
    contacts_attributes: [:id, :name, :phone, :additional_phone, :email, :organization, :position, :image, :_destroy]

  # permit_params do
  #   params = [:title, :content, :publisher_id]
  #   params.push :author_id if current_user.admin?
  #   params
  # end

  index do
    selectable_column
    column :title
    column :subtype do |event|
      event.subtype.text
    end
    column :external
    column :subject
    column :category do |event|
      event.decorate.category_title
    end
    column :aasm_state do |event|
      t(event.aasm_state, scope: 'aasm.event.state')
    end
    column :start
    column :finish
    actions defaults: false do |event|
      span item t('active_admin.view'), resource_path(event)
      span item t('active_admin.edit'), edit_resource_path(event)
    end
  end

  filter :title
  filter :subtype, as: :select
  filter :external
  filter :subject, as: :select
  filter :category, as: :select
  filter :aasm_state
  filter :description
  filter :start
  filter :finish
  filter :author
  filter :created_at

  before_save do |event|
    event.author = current_user
  end

  form do |event|
    event.semantic_errors
    event.semantic_errors *event.object.errors.keys
    tabs do
      tab t(:info, scope: 'enumerize.event_document.section') do
        event.inputs do
          event.input :title
          event.input :description
          event.input :subtype
          event.input :category
          event.input :external
          event.input :subject
          event.input :start, as: :datepicker, datepicker_options: { min_date: Date.current }
          event.input :finish, as: :datepicker, datepicker_options: { min_date: Date.current }
        end
        event.inputs do
          event.has_many :info_documents, allow_destroy: true, new_record: true do |document|
            document.input :section, as: :hidden
            document.input :title
            document.input :attached_document, as: :refile
          end
        end
        event.inputs do
          event.has_many :contacts, allow_destroy: true, new_record: true do |contact|
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
        end
      end
      tab t(:excercise, scope: 'enumerize.event_document.section') do
        event.inputs do
          event.input :excercise
        end
        event.inputs do
          event.has_many :excercise_documents, allow_destroy: true, new_record: true do |document|
            document.input :section, as: :hidden
            document.input :title
            document.input :attached_document, as: :refile
          end
        end
      end
      tab t(:resolution, scope: 'enumerize.event_document.section') do
        event.inputs do
          event.input :resolution
        end
        event.inputs do
          event.has_many :resolution_documents, allow_destroy: true, new_record: true do |document|
            document.input :section, as: :hidden
            document.input :title
            document.input :attached_document, as: :refile
          end
        end
      end
    end
    event.actions
  end

  show do
    tabs do
      tab t(:info, scope: 'enumerize.event_document.section') do
        attributes_table do
          row :title
          row :subtype do |event|
            event.subtype.text
          end
          row :external
          row :subject
          row :category do |event|
            event.decorate.category_title
          end
          row :aasm_state do |event|
            t(event.aasm_state, scope: 'aasm.event.state')
          end
          row :description
          row :start
          row :finish
          row :author
          row :created_at
          row :updated_at
          panel t(:documents) do
            event.info_documents.map do |document|
              div do
                link_to document.title, attachment_url(document, :attached_document, filename: document.attached_document_filename)
              end
            end
          end
        end
      end
      tab t(:excercise, scope: 'enumerize.event_document.section') do
        attributes_table do
          row :excercise
          panel t(:documents) do
            event.excercise_documents.map do |document|
              div do
                link_to document.title, attachment_url(document, :attached_document, filename: document.attached_document_filename)
              end
            end
          end
        end
      end
      tab t(:resolution, scope: 'enumerize.event_document.section') do
        attributes_table do
          row :resolution
          panel t(:documents) do
            event.resolution_documents.map do |document|
              div do
                link_to document.title, attachment_url(document, :attached_document, filename: document.attached_document_filename)
              end
            end
          end
        end
      end
    end
  end

  sidebar I18n.t(:interferences), only: :show do
    div id: :intersections do
      event.intersections.each do |other|
        div do
          a href: admin_event_path(other) do
            span other.title
          end
          span other.start
          span other.finish
        end
      end
    end
  end

  sidebar I18n.t(:contacts), only: :show do
    event.contacts.map do |contact|
      div do
        image_tag attachment_url(contact, :image, :fit, 70, 70)
        contact.name
        contact.phone
        contact.additional_phone
        contact.email
        contact.organization
        contact.position
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
    link_to t(:publish, scope: 'active_admin.actions.labels'), publish_admin_event_path(event), method: :post if resource.may_publish?
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
    link_to t(:unpublish, scope: 'active_admin.actions.labels'), publish_admin_event_path(event), method: :post if resource.may_unpublish?
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
    link_to t(:archive, scope: 'active_admin.actions.labels'), publish_admin_event_path(event), method: :post if resource.may_archive?
  end

  batch_action :archive do |ids|
    Event.where(id: ids).each do |event|
      event.archive! if event.may_archive?
    end
    redirect_to admin_events_path
  end
end
