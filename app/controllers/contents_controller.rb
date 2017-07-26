class ContentsController < ApplicationController
  require 'indico'
  Indico.api_key = '7f137af5ba3bf3f4604c6169d9d6b73a'


  def create
    link = params[:content][:link]
    content = Content.new(link: link, mood_id: params[:content][:mood_id], category:params[:categoryx], count:0)
    doc = Nokogiri::HTML(open(link))
    content.subject = doc.at_css('title').text
    x = Indico.emotion(content.subject)
    y = x.sort_by{|emo,num| num}.reverse
    z = y[0][0]
    if    z == 'joy'#<=====
      content.mood_id = 1
    elsif z == 'sadness'
      content.mood_id = 2
    elsif z == 'fear'
      content.mood_id = 3
    elsif z == 'anger'
      content.mood_id = 4
    else
      content.mood_id = 5
    end
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
    @stories = Story.where(mood_id: @mood.id)

    if params[:categoryx]==nil
      @contents = Content.where(mood_id: @mood.id).order("count DESC")
    else
      @contents = Content.where(mood_id: @mood.id, category: params[:categoryx]).order("count DESC")
    end

    render template: "contents/show"
  end

  def redirect
    c = Content.find(params[:id])
    d = c.count
    d += 1
    c.update(count:d)
    redirect_to c.link
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

end
