class ListBuilder
  include Sidekiq::Worker

  def perform(name, month, year)
    featured_list = FeaturedList.create_list(name, month, year)
  end

end
