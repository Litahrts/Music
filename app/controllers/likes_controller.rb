class LikesController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :find_likeable, except: :show
  before_action :find_user, only: :show

  def show
    @songs = @user.liked_songs
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

  def find_user
    @user = User.find_by_username(params[:username])
  end

end
