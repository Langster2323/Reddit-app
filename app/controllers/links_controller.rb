class LinksController < ApplicationController
  def index
    @links = Link.includes(:votes, :urls).limit(10)
    @link = Link.new
    # render template: 'links/index.html.erb', locals: { link: Link.all }
  end

  def show
    # if Link.exists?(params[:id])
    #   render template: 'links/show.html.erb', locals: { link: Link.find(params[:id])}
    # else
    #   render html: "Entity Not Found.", status: 404
    # end
  end

  def new
    @link = Link.new
  #   render locals: {
  #     link: Link.new
  #   }
  end

  def edit
    # render locals: {
    #   link: Link.find(params[:id])
    # }
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to @link, notice: "Link was successfully created"
    else
      render :new
    end
    # link = Link.new
    # link.title = params[:link][:title]
    # link.url = params[:link][:url]
    #
    # if link
    #   link.save
    #   redirect_to action: "index"
    # else
    #   flash[:alert] = "Link could not be saved"
    #   render template: 'link/new.html.erb', locals: {
    #     link: link
    #   }
    # end
  end

  def update
    if @link.update(link_params)
      redirect_to @link, notice: "Link was successfully update"
    else
      render :edit
    end

    # link = Link.find(params[:id])
    # link.title = params[:title] if params[:title].present?
    # link.vote = params[:vote] if params[:vote].present?
    # if link.save
    #   redirect_to link_path(link)
    # else
    #   render template: '/link/new.html.erb', locals: {
    #     link: link
    #   }
    # end
  end

  def destroy
    @link.destroy
    redirect_to link_url, notice: "Link was successfully destroyed"
  end


  private

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:vote, :url, :title)
  end
end
