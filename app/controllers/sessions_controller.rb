class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # log_in and remember function is found in the sessions_helper
      log_in user
      # if remember_me is checked, don't log user out after browser close
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    flash[:success] = 'Successfully logged out'
    log_out if logged_in?
    redirect_to root_url
  end

end
