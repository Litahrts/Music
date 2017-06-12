class SongsController < ApplicationController
  before_action :authenticate_user!

  def new
    @song = Song.new
  end

  def create
    @song = current_user.songs.build(song_params)

    if @song.save
      redirect_to current_user, notice: "Successfully uploaded new audio"
    else
      render 'new'
    end
  end

  def destroy
    @song.destroy
    redirect_to current_user
  end

  private

  def song_params
    params.require(:song).permit(:name, :audio, :picture)
  end

end
