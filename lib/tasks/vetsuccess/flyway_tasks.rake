# namespace :vetsuccess_flyway do
#   desc "Migrates the schema to the latest version. Flyway will create the metadata table automatically if it doesn't exist."
#   task :migrate do
#     Vetsuccess::Flyway::DatabaseTasks.execute_command('migrate')
#   end

#   desc "Drops all objects (tables, views, procedures, triggers, ...) in the configured schemas."
#   task :clean do
#     Vetsuccess::Flyway::DatabaseTasks.execute_command('clean')
#   end

#   desc "Prints the details and status information about all the migrations."
#   task :info do
#     Vetsuccess::Flyway::DatabaseTasks.execute_command('info')
#   end

#   desc "Validates the applied migrations against the ones available on the classpath."
#   task :validate do
#     Vetsuccess::Flyway::DatabaseTasks.execute_command('validate')
#   end

#   desc "Baselines an existing database, excluding all migrations up to and including baselineVersion."
#   task :baseline do
#     Vetsuccess::Flyway::DatabaseTasks.execute_command('baseline')
#   end

#   desc "Repairs the Flyway metadata table."
#   task :repair do
#     Vetsuccess::Flyway::DatabaseTasks.execute_command('repair')
#   end
# end
