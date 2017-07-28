class StoriesController < ApplicationController
  protect_from_forgery

  def new
    if signed_in?
      @story = Story.new
    else
      redirect_to root_path
    end
  end

  def create
    story = Story.new(title: params[:story][:title], contents: params[:story][:contents], mood_id: params[:story][:mood_id], user_id: params[:story][:user_id])
    if story.save
      redirect_to story_path(story)
    else
      redirect_to new_story_path
    end
  end

  def show
    if current_user
      @like = Like.where(story_id: params[:id]).find_by(user_id: current_user.id)
    end
    @story = Story.find(params[:id])
  end

  # private

  # def story_params
  #   params.require(:story).permit(:title, :contents)
  # end

end
