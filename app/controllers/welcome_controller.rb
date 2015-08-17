class WelcomeController < ApplicationController
  before_filter :check_user_logged_in

  def index; end

end
