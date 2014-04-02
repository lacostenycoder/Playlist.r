class Serach < ActiveRecord::Base

  MONTHS = [['January', 1], ['February', 2], ['March', 3], ['April', 4], ['May', 5], ['June', 6], ['July', 7],[ 'August', 8],['September', 9], ['October', 10], ['November', 11], ['December',12]]

  YEARS = []<<(2000..2014).to_a.reverse

  NAME = [['DJ Top 50', 1], ['Beatport Top 50', 2]]

  def filter_search

    search = client.get('/search', :q => 'lacoste nyc') # replayce lacoste nyc with search variable

    results = search[:collection][0..16]  # reduced search to 16

    results.delete_if { |e| e["kind"] != "track" } ### use search type keyword in playce of "track"

  end

end
