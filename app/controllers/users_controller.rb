class UsersController < ApplicationController
 
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @user = current_user
    @admin_users = User.all
    @hr_users = User.where("role != ? AND role != ?", "admin", "Client")
    @sales_users = User.where("role =?", "Client")
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User deleted."
  end

  def destroy_multiple
    User.destroy(params[:users])
      respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :no_content }
    end

  end

  def list_of_client
    @total_client = User.where("role =?", "Client")
     respond_to do |format|
      format.html{redirect_to users_path}
      format.js 
    end
  end

  def edit_password
    @user = User.find(params[:format])
  end

  def update_password
    @user = User.find(params[:format])
    if @user.update_attributes(user_param)
      # Sign in the user by passing validation in case their password changed
      # sign_in @user, :bypass => true
      redirect_to root_path,:notice => "Password Has been Changed Successfully..!"
    else
      render "edit"
    end
  end

  private  
    def user_params
      params.require(:user).permit(:role)
    end

    def user_param
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation)
  end
end
