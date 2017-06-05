class ProfilesController < ApplicationController
  before_action :find_profile
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render 'edit'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :location, :bio)
  end

  def find_profile
    @profile = current_user.profile
  end

end
