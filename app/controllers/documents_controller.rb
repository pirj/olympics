class DocumentsController < ApplicationController
  has_scope :by_subtypes, as: :subtypes, type: :array
  has_scope :by_name, as: :name

  def index
    filters = { subtypes: [] }.with_indifferent_access.merge params.permit(:name, :subtypes)
    render :index, locals: {
      documents: apply_scopes(EventDocument).all,
      filters: filters
    }
  end
end
