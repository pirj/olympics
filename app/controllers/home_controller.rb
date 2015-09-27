class HomeController < ApplicationController
  has_scope :year
  has_scope :month
  has_scope :text

  def index
    filters = params.permit(:year, :month, :text)
    params[:year] ||= Time.current.year
    params[:month] ||= Time.current.month
    params[:text] ||= ''
    render :index, locals: {
      filters: filters,
      events: apply_scopes(Event).limit(8),
      docs: [],
      news: News.actual(3),
      questionnaires: [],
      links: Link.all
    }
  end
end
