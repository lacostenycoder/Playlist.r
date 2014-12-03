environment = ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'development'
if environment == 'development'
  listen 3000, :tcp_nopush => true
  worker_processes 1
else
  worker_processes 3
end

preload_app true
timeout 90

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end
  @sidekiq_pid ||= spawn("bundle exec sidekiq -c 2")
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end
  Sidekiq.configure_client do |config|
    config.redis = { :size => 1 }
  end
  Sidekiq.configure_server do |config|
    config.redis = { :size => 5 }
  end
end
