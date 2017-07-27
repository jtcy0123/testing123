class LikesController < ApplicationController
  def create
    # "like"=>{"story_id"=>"6"}
    sid = params[:like][:story_id]
    s = Story.find(sid)
    user = User.find(s.user_id)
    likes = Like.where(story_id: sid).find_by(user_id: current_user.id)
    if likes == nil
      like = Like.new(story_id: sid, user_id: current_user.id)
      like.save
      pt = user.point + 1
      user.update_attribute('point',pt)
    else
      likes.delete
      pt = user.point - 1
      user.update_attribute('point',pt)
    end
    redirect_back fallback_location: story_path(sid)
  end
end
