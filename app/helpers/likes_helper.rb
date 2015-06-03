module LikesHelper
  def previous_like?
    @likes.select {|like| like.user == current_user}.length == 1
  end

  def new_plus_like
    @like = Like.new
    @like.user_id = current_user.id
    @like.idea = @idea
    @like.value = 1
    @like.save
  end
end
