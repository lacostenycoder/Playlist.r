class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :title
      t.string :remix
      t.integer :rank
      t.string :soundcloud_url
      t.integer :playlist_id
    end
  end
end
