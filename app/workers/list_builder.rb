class HardWorker
  include Sidekiq::Worker

  def perform(params)
    @featured_list = FeaturedList.create_list(parmas[:name], params[:month], params[:year])
  end

end
