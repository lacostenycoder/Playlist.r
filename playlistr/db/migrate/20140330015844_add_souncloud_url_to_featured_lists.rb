class AddSouncloudUrlToFeaturedLists < ActiveRecord::Migration
  def change
    add_column :featured_lists, :soundcloud_url, :string
  end
end
