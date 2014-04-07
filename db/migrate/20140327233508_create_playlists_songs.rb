class CreatePlaylistsSongs < ActiveRecord::Migration
  def change
    create_table :playlists_songs, id: false do |t|
      t.references :playlist_id
      t.references :song_id
    end
  end
end
