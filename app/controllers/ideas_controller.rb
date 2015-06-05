class IdeasController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @ideas = Idea.all.sort_by{|idea|idea.likes_number}.reverse
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to '/ideas'
    else
      render 'new'
    end
  end

  def idea_params
    params.require(:idea).permit(:name, :description)
  end

  def show
    @idea = Idea.find(params[:id])
    @comments = @idea.comment_threads.order('created_at desc')
    @new_comment = Comment.build_from(@idea, current_user.id, "")
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)
    redirect_to '/ideas'
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    flash[:notice] = 'Idea deleted successfully'
    redirect_to '/ideas'
  end
end
