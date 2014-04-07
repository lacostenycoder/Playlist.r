class RemovePasswordConfUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password_conf
  end
end
