root = "/home/deployer/apps/icount-granalturaoil/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.icount-granalturaoil.sock"
worker processes 2
timeout 30