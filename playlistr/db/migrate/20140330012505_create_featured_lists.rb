class CreateFeaturedLists < ActiveRecord::Migration
  def change
    create_table :featured_lists do |t|
      t.string :name
      t.string :month
      t.integer :year
    end
  end
end
