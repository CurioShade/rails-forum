class LoginsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.where(name: user_params[:name], 
            password: user_params[:password]).first
    unless user.nil?
      reset_session
      session[:current_user_id] = user.id
      flash[:notice] = "Successful login!"
      redirect_to root_url
    else
      flash[:alert] = "Wrong name or password!"
      render :new, status: :unauthorized
    end
  end

  def destroy
    session.delete(:current_user_id)
    @_current_user = nil
    redirect_to root_url, status: :see_other
  end

  private
    def user_params
      params.require(:user).permit(:name, :password)
    end
end
