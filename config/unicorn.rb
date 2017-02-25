rails_root = File.expand_path('../..', __FILE__)
worker_processes 1 
working_directory rails_root
stderr_path "#{rails_root}/log/unicorn.log"
stdout_path "#{rails_root}/log/unicorn.log"

# This loads the application in the master process before forking
# worker processes
# Read more about it here:
# http://unicorn.bogomips.org/Unicorn/Configurator.html
preload_app false

timeout 30

if ENV['RACK_ENV'] == "test"
  pid "#{rails_root}/tmp/pids/unicorn_test.pid"
  listen "#{rails_root}/tmp/sockets/unicorn_test.sock", backlog: 64
else
  pid "#{rails_root}/tmp/pids/unicorn.pid"
  listen "#{rails_root}/tmp/sockets/unicorn.sock", backlog: 64
end

before_fork do |server, worker|
  # This option works in together with preload_app true setting
  # What it does is prevent the master process from holding
  # the database connection
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
# Here we are establishing the connection after forking worker
# processes
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.establish_connection
end
