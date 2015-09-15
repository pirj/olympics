class NewsController < ApplicationController
  def index
    render :index, locals: {
      news: News.all
    }
  end

  def show
    item = News.find(params[:id])
    fail NotFound unless item
    render :show, locals: {
      item: item
    }
  end
end
