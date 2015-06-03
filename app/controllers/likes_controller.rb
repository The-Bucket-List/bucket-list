class LikesController < ApplicationController

  def new
    @idea = Idea.find(params[:idea_id])
    @like = Like.new
    @like.user_id = current_user.id
    @like.idea = @idea
    @like.save
    redirect_to :back
  end
end
