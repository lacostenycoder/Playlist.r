class FeaturedListsController < ApplicationController
  def index
    @user = User.all
    @featured_lists = FeaturedList.all
  end

  def show
    @featured_lists = FeaturedList.find(params[:id])
    @songs = @featured_lists.songs
  end

  def new
    @featured_list = FeaturedList.new
  end

  def create
    @featured_list = FeaturedList.new(user_params)
    if @featured_list.save
      flash[:notice] = "Playlist added to database!"
      redirect_to featured_lists_path
    else
      render 'new'
    end
  end

  def update
    @featured_list = FeaturedList.find(params[:id])
    @featured_list.update(user_params)
    flash[:notice] = "Playlist updated!"
    redirect_to @featured_list
  end

  def destroy
    @featured_list = FeaturedList.find(params[:id])
    @featured_list.destroy
    flash[:notice] = "Playlist deleted from database!"
    redirect_to featured_lists_path
  end

  private

  def user_params
    params.require(:name, :month, :year)
  end
end
