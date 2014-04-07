class FixSpellingSouncloudeFieldUsers < ActiveRecord::Migration
  def change
    rename_column :users, :souncloud_username, :soundcloud_username
  end
end
