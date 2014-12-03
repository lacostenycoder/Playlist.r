class Song < ActiveRecord::Base

   has_and_belongs_to_many :featured_lists
   has_and_belongs_to_many :playlists

   paginates_per 20
   max_paginates_per 20

end
