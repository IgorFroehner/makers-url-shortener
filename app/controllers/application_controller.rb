class ApplicationController < ActionController::Base
  def require_user_logged_in!
    redirect_to login_path, alert: 'Você deve estar logado para acessar!' unless helpers.logged_in?
  end
end
