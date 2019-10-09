class UsersController < ApplicationController

  def index
  end

  def logout
  end

  def profile
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :nickname)
  end

end