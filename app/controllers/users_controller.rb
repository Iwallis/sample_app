class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
      # equivalent to redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @flights = @user.flights.paginate(page: params[:page], :per_page => 15)

    @totalSingleDayDual = @user.flights.sum(:day_hours)
    @totalSingleDayPIC = 0
    @totalSingleNightDual =  @user.flights.sum(:night_hours)
    @totalSingleNightPIC = 0
    @totalMultiDayDual = 0
    @totalMultiDayPIC = 0
    @totalMultiNightDual = 0
    @totalMultiNightPIC = 0
    @totalIMC = 0
    @totalHood = 0
    @totalSim = 0

    @flight = current_user.flights.build
    redirect_to root_url and return unless @user.activated
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile successfully updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # misc.

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
