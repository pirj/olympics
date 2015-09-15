class LinksController < ApplicationController
  def index
    render :index, locals: {
      links: Link.all
    }
  end
end
