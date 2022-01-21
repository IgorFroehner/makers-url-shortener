module SessionsHelper
  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end
end
