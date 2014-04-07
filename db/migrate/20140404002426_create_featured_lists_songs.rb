class CreateFeaturedListsSongs < ActiveRecord::Migration
  def change
    create_table :featured_lists_songs, id: false do |t|
      t.references :featured_list
      t.references :song
    end
  end
end
