class Serach < ActiveRecord::Base

  def filter_search

    search = client.get('/search', :q => 'lacoste nyc') # replayce lacoste nyc with search variable

    results = search[:collection][0..16]  # reduced search to 16

    results.delete_if { |e| e["kind"] != "track" } ### use search type keyword in playce of "track"

  end

end
