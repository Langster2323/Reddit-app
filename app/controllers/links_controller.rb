class LinksController < ApplicationController
  def index
    render locals: {
      links: Link.all?
    }
  end

  def show
    render locals: {
      link: Link.find(params[:id])
    }
  end

  def new
    render locals: {
      link: Link.new
    }
  end

  def edit
    render locals: {
      link: Link.find(params[:id])
    }
  end

  def create
    render
  end

  def update
  end

  def destroy
  end

end
