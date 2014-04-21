class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(messages_params)
    if @message.save
      flash[:notice] = "Text Sent."
      redirect_to :back
    else
      flash[:alert] = "Something went wrong."
      @user = current_user
      @contacts = @user.contacts
      @contact = Contact.new
      render('users/show')
    end
  end

  private
  def messages_params
    params.require(:message).permit(:to, :from, :body, :status)
  end
end
