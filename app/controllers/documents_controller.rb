class DocumentsController < ApplicationController
  has_scope :by_subtypes, as: :subtypes
  has_scope :by_name, as: :name

  def index
    filter = { subtypes: [] }.with_indifferent_access.merge params.permit(:name, :subtypes)
    render :index, locals: {
      documents: apply_scopes(Document).all,
      filter: filter
    }
  end
end
