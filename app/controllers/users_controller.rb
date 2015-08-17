class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to url_for(controller: :polls, action: :show)
    else
      render action: 'new'
    end
  end

end
