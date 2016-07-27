class UrlsController < ApplicationController
  def index
    render template: 'url/index.html.erb', locals: {
      Urls: Url.all,
    }
  end

  def show
    if Url.exists?(params[:id])
    Url.find(params[:id])
      render template: 'url/show.html.erb'
    else
      render html: "Url Not Found", status: 404
    end
  end

  def new
    render locals: {
      url: Url.new
    }
  end

  def edit
    render locals: {
      url: Url.find(params[:id])
    }
  end

  def create
  end

  def update
  end
end
