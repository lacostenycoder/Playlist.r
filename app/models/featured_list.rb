class FeaturedList < ActiveRecord::Base
  # max_paginates_per 10
  has_and_belongs_to_many :songs


  MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' ]
  YEARS = (2000..2015).to_a.reverse

  NAME = ['RA Top 50', 'Beatport Top 50']

  def self.soundcloud_links(array)
    artist = array[0]
    title = array[1]
    count_matches = 0
    # begin
    results = SoundCloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID']).get('/search', :q => "#{artist} #{title}")
    tracks = []
    results[:collection].map do |track|
      unless track["kind"] != "track"
        @title_search_array = track["title"].gsub(/\W/, ' ').split
        title.split.each do |word|
          if @title_search_array.include?(word)
           count_matches += 1
         end
       end

     end
     if count_matches >= 1
       track["matches"] = count_matches
       tracks << track
     end
   end
   tracks_only = []
      tracks_only = tracks.select.each do |result|
        result["kind"] == "track" && result["duration"] < 900000
      end

      best_match = tracks_only.each { |best| best["matches"] == best_match}
      longest = 0
      best_match.each do |d|
        longest = d["duration"] if d["duration"] > longest
      end
      if longest > 0
        track = best_match.find { |e| e["duration"] == longest }
        drop_http = track["uri"].gsub(/https:\/\//, '')
        uri = drop_http.gsub(/\/tracks$/, '')
        return uri
      else
        return "Soundcloud Link Not Available"
      end
  end

  def self.create_list(name, month, year)
    @add_list = FeaturedList.new(name: "RA Top 50", month: month, year: year)
    resident_advisor_url = 'http://www.residentadvisor.net/dj-charts.aspx?top=50&mn=' + month.to_s + '&yr=' + year.to_s
    @add_list.save
    require 'open-uri'
    noko_url = lambda {Nokogiri::HTML(open(resident_advisor_url).read)}
    noko_results = noko_url.call
    list = noko_results.css('table.djCharts tr').to_a
    results = list.map{|b| b.css('td')}.map{|c| c.children.map{|a| a.inner_text}}
    results.shift
    results.each do |t|
      search_params = t[2], t[3].gsub(/\W/, ' ')
      url = soundcloud_links(search_params)
      song = Song.create(rank: t[0].to_i, artist: t[2], title: t[3], soundcloud_url: url)
      song.save
      @add_list.songs << song
    end
    # return @add_list
  end

end
