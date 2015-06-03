class LikesController < ApplicationController

  def new
    @idea = Idea.find(params[:idea_id])
    @like = Like.new

  end
end
