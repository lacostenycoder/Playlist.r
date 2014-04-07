class FeaturedList < ActiveRecord::Base
  has_and_belongs_to_many :songs

  MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' ]
  YEARS = (2000..2014).to_a.reverse

  NAME = ['RA Top 50', 'Beatport Top 50']

  def self.convert_month(num)
    case num
      when 1 then num = 'January'
      when 2 then num = 'February'
      when 3 then num = 'March'
      when 4 then num = 'April'
      when 5 then num = 'May'
      when 6 then num = 'June'
      when 7 then num = 'July'
      when 8 then num = 'August'
      when 9 then num = 'September'
      when 10 then num = 'October'
      when 11 then num = 'November'
      when 12 then num = 'December'
    end
  end

  def self.soundcloud_links(search)
    begin
    results = SoundCloud.new(:client_id => "476bff90d2af3f775a10bf5bc1f82928").get('/search', :q => search)
    tracks = []
    #binding.pry
    results[:collection].each do |result|
      if result["kind"] == "track" && result["duration"] < 900000 && result["title"].downcase.include?(search.downcase)
        tracks << result
      end
    end
    # tracks.delete_if do |v|
    #   if v["duration"] < 120000 ### delete tracks 2min or shorter (clips)
    #     true
    #   else
    #     false
    #   end
    # end

    longest = 0
    tracks.each do |d|
      longest = d["duration"] if d["duration"] > longest
    end
    track = tracks.find { |e| e["duration"] == longest } ## longest not best way to find
    drop = track["uri"].gsub(/http:\/\//, '')
    uri = drop.gsub(/\/tracks$/, '')
    return uri

    rescue
       "Soundcloud Link Not Available"
    end
  end

  def self.create_list(name, month, year)
    @add_list = FeaturedList.new(name: "RA Top 50", month: month, year: year)
    noko = 'http://www.residentadvisor.net/dj-charts.aspx?top=50&mn=' + month.to_s + '&yr=' + year.to_s
    @add_list.save
    link = "Nokogiri::HTML(open('" + noko + "'))"
    mess = eval(link)
    list = mess.css('table.djCharts tr').to_a
    results = list.map{|b| b.css('td')}.map{|c| c.children.map{|a| a.inner_text}}
    results.shift
    results.each do |t|
      search_string = t[3]
      url = soundcloud_links(search_string)
      song = Song.create(rank: t[0].to_i, artist: t[2], title: t[3], soundcloud_url: url)
      song.save
      @add_list.songs << song
    end
    return @add_list
  end

end
