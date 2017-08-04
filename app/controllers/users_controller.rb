class UsersController < ApplicationController
  
  def new 
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to :products
    else
      redirect_to new_user_path
    end
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password
    )
  end
  
end
