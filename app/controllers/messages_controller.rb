class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    # "message"=>{"content"=>"hello", "user_id"=>"1", "mood_id"=>"2"}
    @message = Message.create!(msg_params)
  end

  private

  def msg_params
    params.require(:message).permit(:content, :user_id, :mood_id)
  end
end
