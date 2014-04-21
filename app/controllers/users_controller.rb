class UsersController <ApplicationController

  def show
    @user = User.find(params[:id])
    @message = Message.new
    @contact = Contact.new
    @contacts = @user.contacts
  end

  private
  def users_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
