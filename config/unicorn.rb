app = "alonsi"
user = "ilnur"
root = "/home/#{user}/#{app}/current"
working_directory root
pid "#{root}/tmp/pids/unicorn-site.pid"
stderr_path "#{root}/log/unicorn-site.log"
stdout_path "#{root}/log/unicorn-site.log"

listen "/home/#{user}/#{app}/shared/unicorn-site.sock"
# listen socket_file, :backlog => 1024
worker_processes 2
timeout 30
