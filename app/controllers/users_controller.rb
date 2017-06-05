class UsersController < ApplicationController
  def show
    @user = User.find_by_username(params[:username])
    @profile = @user.profile
  end

end
