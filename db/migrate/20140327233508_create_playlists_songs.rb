class CreatePlaylistsSongs < ActiveRecord::Migration
  def change
    create_table :playlists_songs, id: false do |t|
      t.references :playlist
      t.references :song
    end
  end
end
