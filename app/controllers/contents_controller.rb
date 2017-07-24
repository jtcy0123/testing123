class ContentsController < ApplicationController
  def create
    link = params[:content][:link]
    content = Content.new(link: link, mood_id: params[:content][:mood_id])
    doc = Nokogiri::HTML(open(link))
    content.subject = doc.at_css('title').text
    if content.save
      redirect_to content_path(content.mood_id)
    end
  end

  def show
    @content = Content.new
    @mood = Mood.find(params[:id])
    byebug
      if params[:categoryx]==nil
        @contents = Content.where(mood_id: @mood.id)
      else
        @contents = Content.where(mood_id: @mood.id, category: params[:categoryx])
      end
    # render template: "contents/show"
  end
end
