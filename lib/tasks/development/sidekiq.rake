# frozen_string_literal: true

namespace :development do
  namespace :sidekiq do
    desc "reset Sidekiq"
    task clear_queues_and_stats: :environment do
      raise "Environment is not 'development'" unless Rails.env.development?

      puts "Sidekiq RetrySet cleared" if Sidekiq::RetrySet.new.clear
      puts "Sidekiq ScheduledSet cleared" if Sidekiq::ScheduledSet.new.clear
      puts "Sidekiq DeadSet cleared" if Sidekiq::DeadSet.new.clear
      puts "Sidekiq Queue all cleared" if Sidekiq::Queue.all.each(&:clear)
      puts "Sidekiq Stats cleared" if Sidekiq::Stats.new.reset
    end
  end
end
