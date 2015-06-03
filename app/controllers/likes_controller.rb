class LikesController < ApplicationController
  include LikesHelper

  def new
    @idea = Idea.find(params[:idea_id])
    @likes = Like.where("idea_id = #{@idea.id}")
    unless previous_like?
      new_plus_like
    end
    redirect_to :back
  end
end
