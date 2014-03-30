class PlaylistsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @playlists = @user.playlists
  end

  def show
    @playlist = Playlist.find(params[:id])
    @songs = @playlist.songs
  end

  def new
    @playlist = Song.new
  end

  def create
    @playlist = Playlist.new(user_params)
    if @playlist.save
      flash[:notice] = "Playlist added to database!"
      redirect_to playlist_path
    else
      render 'new'
    end
  end

  def update
    @playlist = Playlist.find(params[:id])
    @playlist.update(user_params)
    flash[:notice] = "Playlist updated!"
    redirect_to @playlist
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    flash[:notice] = "Playlist deleted from database!"
    redirect_to user_playlist_path
  end

  private

  def user_params
    params.require(:name, :month, :year)
  end
end
