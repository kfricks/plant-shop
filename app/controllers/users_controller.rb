class UsersController < ApplicationController
  def show
  @user = User.find(params[:id])
  end
  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    user.avatar.attach(params[:avatar])
    user.save!
    redirect_to root_path
  end

private
  def user_params
    params.require(:user).permit(:email_address, :password, :avatar)
  end
end
