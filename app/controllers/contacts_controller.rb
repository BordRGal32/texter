class ContactsController < ApplicationController

  def show
    @contact = Contact.find(params[:id])
    @message = Message.new
  end

  def create
    @contact = Contact.new(contact_params)
    @user = User.find(params[:user_id])
    @contacts = @user.contacts
    @messages = Message.all
    if @contact.save
      flash[:notice] = "Your contact has been saved!"
      redirect_to :back
    else
      flash[:alert] = "There was an error creating your contact."
      render 'users/show'
    end
  end

  def update
    @contact = Contact.find(params[:id])
    @user = User.find(@contact.user_id)
    @contacts = @user.contacts

    if @contact.update(contact_params)
      flash[:notice] = "Your contact has been updated!"
      redirect_to :back
    else
      flash[:alert] = "There was an error updating your contact."
      render 'users/show'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to user_path(current_user)
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :phone_number, :user_id)
  end
end
