class ChangeFeaturedLists < ActiveRecord::Migration
  def change
    remove_column :featured_lists, :soundcloud_url
  end
end
