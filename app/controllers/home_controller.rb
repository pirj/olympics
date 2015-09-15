class HomeController < ApplicationController
  def index
    render :index, locals: {
      news: NewsEntry.actual(3),
      links: Link.all
    }
  end
end
