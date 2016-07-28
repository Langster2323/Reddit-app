class LinksController < ApplicationController
  def index
    render template: 'links/index.html.erb', locals: { link: Link.all }
  end

  def show
    if Link.exists?(params[:id])
      render template: 'link/show.html.erb', locals: { link: Link.find(params[:id])}
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
    if link.save
      redirect_to_link_path(link)
    else
      flash[:alert] = "Link could not be saved"
      render template: 'link/new.html.erb', locals: {
        link: link
      }
    end
  end

  def update
    link = Link.find(params[:id])
    link.title = params[:link][:title] if params[:link][:title].present?
    if link.save
      redirect_to_link_path(link)
    else
      render template: '/link/new.html.erb', locals: {
        link: link
      }
    end
  end

  def destroy
  end

end
