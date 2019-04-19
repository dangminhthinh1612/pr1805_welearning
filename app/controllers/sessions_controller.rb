class SessionsController < ApplicationController

  def new
    if logged_in?
      flash[:danger] = "Logout before login, please!."
      redirect_back_or current_user
    end
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        remember(user) if params[:session][:remember_me] == "1"
        redirect_back_or user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Tài khoản hoặc mật khẩu sai."
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
