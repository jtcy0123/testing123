class WelcomeController < ApplicationController
  before_action :require_login, only: [:new]
  def index
    @moods = Mood.all
    @contents = Content.all.order("count DESC")
  end

end
