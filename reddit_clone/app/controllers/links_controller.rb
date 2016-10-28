class LinksController < ApplicationController


  def index
    @links = Link.all.order(votes: :desc)
  end


  def new
    @links = Link.new
  end

  def create
    @links = Link.new(links_params)
    @links.votes = 1
    if @links.save
      redirect_to root_path
    else
      render :new
    end
  end

  def upvote
    @links = Link.find(params[:id])
    @links.votes +=1
    @links.save
    redirect_to root_path
  end

  def downvote
    @links = Link.find(params[:id])
    @links.votes -=1
    @links.save
    redirect_to root_path
  end

  def links_params
    params.require(:link).permit(:title, :url, :summary)
  end

end
