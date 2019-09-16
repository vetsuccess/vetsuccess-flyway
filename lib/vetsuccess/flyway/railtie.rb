module Vetsuccess
  module Flyway
    class Railtie < ::Rails::Railtie

      rake_tasks do
        namespace :vetsuccess_flyway do
          desc "Migrates the schema to the latest version. Flyway will create the metadata table automatically if it doesn't exist."
          task :migrate, [:cluster] => :environment do |task, args|
            Vetsuccess::Flyway::DatabaseTasks.execute_command('migrate', args[:cluster])
          end

          desc "Prints the details and status information about all the migrations."
          task :info, [:cluster] => :environment do |task, args|
            Vetsuccess::Flyway::DatabaseTasks.execute_command('info', args[:cluster])
          end

          desc "Validates the applied migrations against the ones available on the classpath."
          task :validate, [:cluster] => :environment do |task, args|
            Vetsuccess::Flyway::DatabaseTasks.execute_command('validate', args[:cluster])
          end

          desc "Drops all objects (tables, views, procedures, triggers, ...) in the configured schemas."
          task :clean, [:cluster] => :environment do |task, args|
            Vetsuccess::Flyway::DatabaseTasks.execute_command('clean', args[:cluster])
          end

          desc "Baselines an existing database, excluding all migrations up to and including baselineVersion."
          task :baseline, [:cluster] => :environment do |task, args|
            Vetsuccess::Flyway::DatabaseTasks.execute_command('baseline', args[:cluster])
          end

          desc "Repairs the Flyway metadata table."
          task :repair, [:cluster] => :environment do |task, args|
            Vetsuccess::Flyway::DatabaseTasks.execute_command('repair', args[:cluster])
          end
        end
      end
    end
  end
end
