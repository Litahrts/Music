class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_likeable

  def show
  end

  def create
    current_user.like(@song)
    redirect_to :back
  end

  def destroy
    current_user.unlike(@song)
    redirect_to :back
  end

  private

  def find_likeable
    @song = Song.find(params[:id])
  end

end
