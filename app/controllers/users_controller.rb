class UsersController <ApplicationController

  def show
    @user = User.find(params[:id])
  end

  private
  def users_params
  requre(:user).permit(:email, :username, :password, :password_confirmation)
end
