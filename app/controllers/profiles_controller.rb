class ProfilesController < ApplicationController
  before_action :find_profile
  before_action :authenticate_user!

  def edit

  end

  def update
    if @profile.update(profile_params)
      redirect_to :back, notice: "Your profile has been updated successfully."
    else
      render 'edit'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :location, :bio, :avatar)
  end

  def find_profile
    @profile = current_user.profile
  end

end
