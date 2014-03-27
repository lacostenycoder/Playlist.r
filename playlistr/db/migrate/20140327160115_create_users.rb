class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :password_conf
      t.string :password_digest
      t.boolean :admin
      t.string :souncloud_username
    end
  end
end
