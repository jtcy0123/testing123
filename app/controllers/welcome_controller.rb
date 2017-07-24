class WelcomeController < ApplicationController
  before_action :require_login, only: [:new]
  def index
    @user = User.new
    @moods = Mood.all
  end
end
