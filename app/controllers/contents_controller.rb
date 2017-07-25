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
    @user = User.new
    @content = Content.new
    @comment = Comment.new
    @messages = Message.all
    @mood = Mood.find(params[:id])
    @moods = Mood.all
    @contents = Content.where(mood_id: @mood.id)
    render template: "contents/show"
  end

  def new
  end
end
