class RemoveIdsFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :featured_list_id
  end
end
