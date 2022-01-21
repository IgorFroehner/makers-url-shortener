class SessionsController < ApplicationController
  def new
    redirect_to root_path if helpers.logged_in?
  end

  def create
    @user = User.find_by(email: params[:email])
    if !@user.nil? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      message = "Alguma coisa deu errado! Verifique se seu email e senha estão corretos"
      redirect_to login_path, alert: message, status: :unauthorized
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end
end
