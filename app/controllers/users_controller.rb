class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      log_in @user
      redirect_to @user
      # equivalent to redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    # uncomment below to have a debugging console added when using server
    # debugger
    #
    # ex:
    # (byebug) @user.name
    # "Example User"
    # (byebug) @user.email
    # "example@railstutorial.org"
    # (byebug) params[:id]
    # "1"
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
