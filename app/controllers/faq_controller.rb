class FaqController < ApplicationController
  has_scope :by_text, as: :text

  def index
    filter = params.permit(:text)
    render :index, locals: {
      faqs: apply_scopes(Faq).all,
      filter: filter
    }
  end
end
