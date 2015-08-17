module AuthorizeHelper

  def sign_in(user)
    session[:user_id] = user.id
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sign_out
    session[:user_id] = nil
    self.current_user = nil
  end

  def signed_in?
    current_user.present?
  end

  def deny_access
    redirect_to sign_in_path
  end

  def authorize
    if signed_in?
      redirect_to polls_path if root_page?
    else
      deny_access
    end
  end

  def check_user_logged_in
    redirect_to polls_path if signed_in?
  end

  private

  def root_page?
    puts request.path
    ['/','/sign_in'].include?(request.path)
  end

end
