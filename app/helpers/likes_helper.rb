module LikesHelper

  def previous_like?
    @likes.select {|like| like.user == current_user}.length == 1
  end
end
