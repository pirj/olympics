class EventsController < ApplicationController
  include DocumentsHelper

  has_scope :year
  has_scope :by_subtypes, as: :subtypes
  has_scope :by_subjects, as: :subjects

  def index
    filters = { subtypes: {}, subjects: {} }.with_indifferent_access.merge params.permit(:year, subjects: [], subtypes: [])
    params[:year] ||= Time.current.year
    render :index, locals: {
      filters: filters,
      events: apply_scopes(Event).all.decorate
    }
  end

  def show
    render :show, locals: { event: Event.find(params[:id]).decorate }
  end
end
