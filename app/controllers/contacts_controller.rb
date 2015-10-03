class ContactsController < ApplicationController
  has_scope :by_text, as: :text
  has_scope :by_subtypes, as: :subtypes, type: :array
  has_scope :by_subjects, as: :subjects, type: :array

  def index
    filters = { subtypes: {}, subjects: {} }.with_indifferent_access.merge params.permit(:text, subjects: [], subtypes: [])
    render :index, locals: {
      filters: filters,
      contacts_by_subtype: apply_scopes(Contact).joins(:event).group_by { |contact| contact.event.subtype }
    }
  end
end
