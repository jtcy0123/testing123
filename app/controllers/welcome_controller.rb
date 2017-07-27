class WelcomeController < ApplicationController
  before_action :require_login, only: [:new]
  def index
    @moods = Mood.all
    if params[:q]!=nil
      @contents = Content.all.order("count DESC").where("subject LIKE (?)", "%#{params[:q]}%")
      if @contents == nil
        @contents = Content.all.order("count DESC")
      end
    else
      @contents = Content.all.order("count DESC")
    end
  end

end
