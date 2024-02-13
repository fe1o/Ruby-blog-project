class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account was created successfully"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  
  end

  def update
    if  @user.update(user_params)
      flash[:notice] = "Account was updated successfully."
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end