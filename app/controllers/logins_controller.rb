class LoginsController < ApplicationController
  layout "application"
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: user_params[:name])&.
    authenticate(user_params[:password])
    unless @user.nil? || @user == false
      reset_session
      session[:current_user_id] = @user.id
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
