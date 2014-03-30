class Playlist < ActiveRecord::Base

  MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' ]
  YEARS = [2000..2014]

  belongs_to :user
  has_and_belongs_to_many :songs

end
