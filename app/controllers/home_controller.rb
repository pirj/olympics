class HomeController < ApplicationController
  def index
    render :index, locals: {
      docs: [],
      news: News.actual(3),
      questionnaires: [],
      links: Link.all
    }
  end
end
