class FeaturedListsController < ApplicationController

  def lookup
    @featured_list = FeaturedList.new
  end

  def soundcloud_links(search)
    results = []
    results << @client.get('/search', :q => search)
    results = tracks[:collection][0..16]
    results.delete_if { |e| e["duration"] > 900000 }
    longest = 0
    results.each do |d|
      if d["duration"] > longest
        longest = d["duration"]
      end
    end
    track = results.find { |e| e["duration"] == longest }
    uri = track[:uri].gsub(/\/tracks$/, '')
  end


  def run_lookup
    #render text: params.inspect
    #chart = get_chart(params[:name], params[:month], params[:year])
    noko = 'http://www.residentadvisor.net/dj-charts.aspx?top=50&mn=' + params[:month].to_s + '&yr=' + params[:year].to_s
    link = "Nokogiri::HTML(open('" + noko + "'))"
    grab = eval(link)
    @results = grab.map{|b| b.css('td')}.map{|c| c.children.map{|a| a.inner_text}}
    @results.shift

    #@count_results = @results.count

    # @results.each do |url|
    #   search_string = url[:title]
    #   url << soundcloud_links(search_string)
    # end
#     gsub(/\/tracks$/, '')

  end

  def index
    @user = User.all
    @featured_lists = FeaturedList.all
  end

  def show
    @featured_list = FeaturedList.find(params[:id])
  end

  def new
    @featured_list = FeaturedList.new
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
    params.require(:featured_list).permit(:name, :month, :year, :soundcloud_url)
  end

  def search_params
    params.require(:featured_list).permit(:name, :month, :year)
  end

  # def embed_song(link)
  #   <iframe width="80%" height="200" scrolling="no" frameborder="no" src="#{link}"></iframe>
  # end

end
