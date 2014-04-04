class AddFeaturedListsIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :featured_list_id, :integer
    add_index :songs, :featured_list_id
  end
end
