class User < ApplicationController
  has_secure_password
  has_many :playlists

  validates(:email, uniqueness: true, presence: true)
  validates(:password, length:{ minimum: 5 })
  validates(:name, presence: true)
  validates(:admin, inclusion: { in: [true, false]})
end
