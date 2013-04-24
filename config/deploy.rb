#FROM RAILSCASTS
require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
#load "config/recipes/nodejs"
#load "config/recipes/rbenv"	#uncomment for fresh server install
load "config/recipes/check"

server "178.79.186.24", :web, :app, :db, primary: true

set :user, "deployer"
#set :application, "icount_granaltura"
set :application, "icount_abeembolak"
#set :application, "icount_bambol"


set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :default_environment, { 'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH" }

set :scm, "git"
set :repository, "https://github.com/littlebluefountains/icount.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup"	#keep only the last 5 releases
