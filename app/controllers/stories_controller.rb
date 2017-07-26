class StoriesController < ApplicationController
  protect_from_forgery

  def new
    @story = Story.new
  end

  def create
    byebug
    story = Story.new(title: params[:story][:title], contents: params[:story][:contents])
    if story.save
      redirect_to story_path(story)
    else
      redirect_to new_story_path
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  # private

  # def story_params
  #   params.require(:story).permit(:title, :contents)
  # end

end
