class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    Idea.create(idea_params)
    redirect_to '/ideas'
  end

  def idea_params
    params.require(:idea).permit(:name)
  end
end
