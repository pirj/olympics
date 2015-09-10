class NewsController < ApplicationController
  def index
    render :index, locals: {
      news: NewsEntry.all
    }
  end

  def show
    entry = NewsEntry.find(params[:id])
    fail NotFound unless entry
    render :show, locals: {
      entry: entry
    }
  end
end
