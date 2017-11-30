class UsersController < ApplicationController
  def new
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
end
