class SongsController < ApplicationController

  def index
    @songs = Songs.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(user_params)
    if @song.save
      flash[:notice] = "Song added to database!"
      redirect_to songs_path
    else
      render 'new'
    end
  end

  def edit
    @song = Song.find(params[:id])
    render 'edit'
  end

  def update
    @song = Song.find(params[:id])
    @song .update(user_params)
    flash[:notice] = "Song updated!"
    redirect_to @song
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted from database!"
    redirect_to songs_path
  end

  private

  def user_params
    params.require(:title, :artist).permit(:remix, :rank, :soundcloud_url)

end
