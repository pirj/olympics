class ContactsController < ApplicationController
  has_scope :by_text, as: :text

  def index
    filter = params.permit(:text)
    render :index, locals: {
      contacts: apply_scopes(Contact).all,
      filter: filter
    }
  end
end
