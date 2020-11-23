module Vetsuccess
  module Flyway
    class DatabaseTasks

      def self.execute_command(type, cluster, database = cluster)
        new(type, cluster, database).execute_command
      end

      def initialize(type, cluster, database)
        @type = type
        @cluster = cluster
        @database = database
      end

      def execute_command
        command = "#{executable_path} #{type} #{flyway_command_options}"
        system command
      end

      private

      attr_reader :type, :cluster, :database

      def host_suffix
        ENV['REDSHIFT_COPY_HOST_SUFFIX']
      end

      def port
        ENV['REDSHIFT_COPY_PORT']
      end

      def password
        cluster == ENV['REDSHIFT_TEST_CLUSTER'] ? ENV['REDSHIFT_TEST_COPY_PASSWORD'] : ENV['REDSHIFT_COPY_PASSWORD']
      end

      def user
        ENV['REDSHIFT_COPY_USERNAME']
      end

      def directory
        ENV['FLYWAY_MIGRATION_DIRECTORY']
      end

      def config
        ::Rails.configuration.database_configuration[::Rails.env]
      end

      def flyway_command_options
        [
          "-url=jdbc:redshift://#{cluster}.#{host_suffix}:#{port}/#{database}",
          "-user=#{user}",
          "-password=#{password}"
        ].join(' ')
      end

      def executable_path
        File.expand_path("../../../../flyway", __FILE__)
      end

    end
  end
end
