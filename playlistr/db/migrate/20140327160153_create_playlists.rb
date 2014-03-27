class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :month
      t.integer :year
      t.integer :song_id
    end
  end
end
