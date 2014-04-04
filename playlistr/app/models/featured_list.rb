class FeaturedList < ActiveRecord::Base
  has_and_belongs_to_many :songs

  MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' ]
  YEARS = (2000..2014).to_a.reverse

  NAME = ['DJ Top 50', 'Beatport Top 50']

end
