class User < ActiveRecord::Base
  has_secure_password
  has_many :playlists
  # has_many :songs, :through => :playlists_songs

  # accepts_nested_attributes

  validates(:email, uniqueness: true, presence: true)
  validates(:password, length:{ minimum: 5 })
  validates(:username, presence: true)
  validates(:admin, inclusion: { in: [true, false]})
end
