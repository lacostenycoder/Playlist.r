module FeaturedListsHelper

  def month_options
    months = %w(January February March April May June
    July August September October November December)
    arr = []
    months.each_with_index do |month, index|
      arr << [month, index+1]
    end
    return arr
  end

  def year_options
    current_year = Time.now.to_date.year.to_i
    eight_years_ago = current_year - 8
    [*eight_years_ago..current_year]
  end

end
