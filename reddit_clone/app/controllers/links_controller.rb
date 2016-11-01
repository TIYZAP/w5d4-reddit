class LinksController < ApplicationController


  def index
    @links = Link.all.order(votes: :desc)
  end


  def new
    @links = Link.new
  end

  def create
    if current_user
    @links = Link.new(links_params)
    @links.votes = 1
    @links = current_user.links.new(links_params)
    if @links.save
      flash[:success] = "Your link is posted!"
      redirect_to root_path
    else
      render :new
    end

    else
      flash[:warning] = "You must be logged in to Post! Create an account below :)"
      redirect_to new_user_path
    end

  end

  def upvote
    if current_user
    @links = Link.find(params[:id])
    @links.votes = 0 unless @links.votes
    @links.votes += 1
    @links.save
    redirect_to :root
  else
    flash[:warning] = "You must be logged in to Upvote!"
    redirect_to login_path
  end
end

  def downvote
    if current_user
    @links = Link.find(params[:id])
    @links.votes = 0 unless @links.votes
    @links.votes -= 1
    @links.save
    redirect_to :root
  else
    flash[:warning] = "You must be logged in to Downvote!"
    redirect_to login_path
  end
end


  def visit
    @links = Link.find(params[:id])
    @links.votes +=1
    @links.save
    redirect_to @links.url
  end

  def links_params
    params.require(:link).permit(:title, :url, :summary)
  end

end
