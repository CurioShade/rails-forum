class SignupsController < ApplicationController
  def new
    @user = User.new()
  end
  
  def create
    @user = User.new(user_params.merge(access_type: :standard_access))
    if @user.save
      flash[:notice] = "Account was successfuly created! You can now log in."
      redirect_to root_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
