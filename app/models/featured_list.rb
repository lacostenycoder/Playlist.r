class FeaturedList < ActiveRecord::Base
  has_and_belongs_to_many :songs

  MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' ]
  YEARS = (2000..2014).to_a.reverse

  NAME = ['RA Top 50', 'Beatport Top 50']

  def self.convert_month(num)
    case num.to_i
    when 1 then month = 'January'
    when 2 then month = 'February'
    when 3 then month = 'March'
    when 4 then month = 'April'
    when 5 then month = 'May'
    when 6 then month = 'June'
    when 7 then month = 'July'
    when 8 then month = 'August'
    when 9 then month = 'September'
    when 10 then month  = 'October'
    when 11 then month  = 'November'
    when 12 then month  = 'December'
    end
    return month
  end

  def self.soundcloud_links(array)
    artist = array[0]
    title = array[1]
    count_matches = 0
    # begin
    results = SoundCloud.new(:client_id => "476bff90d2af3f775a10bf5bc1f82928").get('/search', :q => "#{artist} #{title}")
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
        drop_http = track["uri"].gsub(/http:\/\//, '')
        uri = drop_http.gsub(/\/tracks$/, '')
        return uri
      else
        return "Soundcloud Link Not Available"
      end
  end

  def self.create_list(name, month, year)
    month_word = convert_month(month)
    @add_list = FeaturedList.new(name: "RA Top 50", month: month_word, year: year)
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
