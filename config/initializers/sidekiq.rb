Sidekiq.configure_server do |config|
  config.redis = { url: Figaro.env.REDIS_URL } # Replace with your Redis URL
end

Sidekiq.configure_client do |config|
  config.redis = { url: Figaro.env.REDIS_URL } # Replace with your Redis URL
end

schedule_file = "config/schedule.yml"
Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file) if File.exist?(schedule_file) && Sidekiq.server?
