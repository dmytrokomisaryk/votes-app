class SessionsController < ApplicationController

  def new;  end

  def create
    user_attrs = params[:session]
    user = User.authenticate(user_attrs[:email], user_attrs[:password])

    if user.nil?
      flash.now[:error] = 'Invalid email/password combination.'
      render :new
    else
      sign_in(user)
      redirect_to polls_path
    end
  end

  def destroy
    sign_out
    redirect_to sign_in_path
  end

end
