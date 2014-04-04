class FeaturedListsController < ApplicationController

  def lookup
    @featured_list = FeaturedList.new
  end

  def soundcloud_links(search)
    begin
    results = SoundCloud.new(:client_id => "476bff90d2af3f775a10bf5bc1f82928").get('/search', :q => search)
    tracks = []
    #binding.pry
    results[:collection].each do |result|
      if result["kind"] == "track" && result["duration"] < 900000
        tracks << result
      end
    end
    longest = 0
    tracks.each do |d|
      longest = d["duration"] if d["duration"] > longest
    end

    track = tracks.find { |e| e["duration"] == longest }
    drop = track["uri"].gsub(/http:\/\//, '')
    uri = drop.gsub(/\/tracks$/, '')
    return uri

    rescue
       "Soundcloud Link Not Available"
    end
  end


  def run_lookup
    @add_list = FeaturedList.new(name: "RA Top 50", month: params[:month], year: params[:year])
    @add_list.save
    noko = 'http://www.residentadvisor.net/dj-charts.aspx?top=50&mn=' + params[:month].to_s + '&yr=' + params[:year].to_s
    link = "Nokogiri::HTML(open('" + noko + "'))"
    mess = eval(link)
    list = mess.css('table.djCharts tr').to_a
    @results = list.map{|b| b.css('td')}.map{|c| c.children.map{|a| a.inner_text}}
    @results.shift
    @results.each do |t|
      search_string = t[2]
      url = soundcloud_links(search_string)
      song = Song.create(rank: t[0].to_i, artist: t[2], title: t[3], soundcloud_url: url)
      song.save
      @add_list.songs << song
    end

   return @results

  end

  def index
    @user = User.all
    @featured_lists = FeaturedList.all
  end

  def show
    @featured_list = FeaturedList.find(params[:id])
    @songs = @featured_list.songs
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
