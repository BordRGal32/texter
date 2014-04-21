class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(messages_params)
    if @message.save
      flash[:notice] = "Text Sent"
      redirect_to :back
    else
      flash[:notice] = "something went wrong"
      render "index"
    end
  end

  private
  def messages_params
    params.require(:message).permit(:to, :from, :body, :status)
  end
end
