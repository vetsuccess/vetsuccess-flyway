module Vetsuccess
  module Flyway
    class DatabaseTasks

      def self.execute_command(type, cluster)
        new(type, cluster).execute_command
      end

      def initialize(type, cluster)
        @type = type
        @cluster = cluster
      end

      def execute_command
        command = "#{executable_path} #{type} #{flyway_command_options}"
        system command
      end

      private

      attr_reader :type, :cluster

      def host_suffix
        ENV['REDSHIFT_COPY_HOST_SUFFIX']
      end

      def port
        ENV['REDSHIFT_COPY_PORT']
      end

      def password
        ENV['REDSHIFT_COPY_PASSWORD']
      end

      def user
        ENV['REDSHIFT_COPY_USERNAME']
      end

      def database
        cluster
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
          "-password=#{password}",
          "-locations=filesystem:#{directory}"
        ].join(' ')
      end

      def executable_path
        File.expand_path("../../../../flyway", __FILE__)
      end

    end
  end
end
