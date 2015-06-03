class LikesController < ApplicationController
  include LikesHelper

  def new
    @idea = Idea.find(params[:idea_id])
    @likes = Like.where("idea_id = #{@idea.id}")
    unless previous_like?
      @like = Like.new
      @like.user_id = current_user.id
      @like.idea = @idea
      @like.save
    end
    redirect_to :back
  end
end
