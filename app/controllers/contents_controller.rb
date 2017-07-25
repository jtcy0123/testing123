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
    @contents = Content.where(mood_id: @mood.id).order("clicks DESC")
    render template: "contents/show"
  end
  
  def new
  end
  
  def click
    content = Content.find(params["id"].to_i)
    old_click_count = content.clicks
    new_click_count = old_click_count + 1
    if content.update(clicks: new_click_count)
      render json: {click_count: content.clicks}
    else
      render json: {message: "error"}
    end
    
end
