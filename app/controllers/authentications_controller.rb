class AuthenticationsController < ApplicationController

  before_action :authenticate_user, only: [:destroy]

  def new
    # disables navs so that unauthenticated users can login
    @disable_top_nav = true
    @disable_right_nav = true
    # Are they already logged in?
    if current_user # They are!  Can't create them again.
      redirect_to user
    else
      @user = User.new
#      render :new
    end
  end

  def create
    user = User.where(email: params[:user][:email]).first
    if user
      # authenticate user
      if user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user
      else
        flash.now[:error] = "Unable to sign you in. Please try again."
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url,
     notice: "You signed out."
  end
  
end
