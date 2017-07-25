class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.create!(msg_params)
  end

  private

  def msg_params
    params.require(:message).permit(:content)
  end
end
