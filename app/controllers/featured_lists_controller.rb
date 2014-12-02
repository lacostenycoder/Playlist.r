class FeaturedListsController < ApplicationController

  def lookup
    @featured_list = FeaturedList.new
  end

  def run_lookup
    ListBuilder.perform_async(params)
    flash[:notice] = "List is being created, refresh page in 1 - 5 minutes"
    redirect_to featured_lists_path
  end


  def index
      @featured_lists = FeaturedList.all
  end

  def show
    @featured_list = FeaturedList.find(params[:id])
    @songs = @featured_list.songs
  end

  def new
    # @featured_list = FeaturedList.new
  end

  def create
    @featured_list = FeaturedList.new(featured_list_params)
    if @featured_list.save
      flash[:notice] = "Playlist added to database!"
      redirect_to featured_lists_path
    else
      render 'new'
    end
  end

  def edit
    @featured_list = FeaturedList.find(params[:id])
  end

  def update
    @featured_list = FeaturedList.find(params[:id])
    @featured_list.update(featured_list_params)
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

  def featured_list_params
    params.require(:featured_list).permit(:name, :month, :year)
  end

  def search_params
    params.require(:featured_list).permit(:name, :month, :year)
  end

  # def embed_song(link)
  #   <iframe width="80%" height="200" scrolling="no" frameborder="no" src="#{link}"></iframe>
  # end
end
