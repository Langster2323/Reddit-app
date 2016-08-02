class LinksController < ApplicationController
  def index
    render template: 'links/index.html.erb', locals: { link: Link.all }
  end

  def show
    if Link.exists?(params[:id])
      render template: 'links/show.html.erb', locals: { link: Link.find(params[:id])}
    else
      render html: "Entity Not Found.", status: 404
    end
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
    link = Link.new
    link.title = params[:link][:title]
    link.url = params[:link][:url]

    if link
      link.save
      redirect_to action: "index"
    else
      flash[:alert] = "Link could not be saved"
      render template: 'link/new.html.erb', locals: {
        link: link
      }
    end
  end

  def update
    link = Link.find(params[:id])
    link.title = params[:title] if params[:title].present?
    link.vote = params[:vote] if params[:vote].present?
    if link.save
      redirect_to link_path(link)
    else
      render template: '/link/new.html.erb', locals: {
        link: link
      }
    end
  end

  def destroy
  end

end
