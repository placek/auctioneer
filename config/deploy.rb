$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, '1.9.2@auctioneer'        # Or whatever env you want it to run in.
set :rvm_type, :user  # Copy the exact line. I really mean :user here
set :use_sudo, false

default_run_options[:pty] = true

set :application, "auctioneer"
set :repository,  "git@github.com:auctioneer.git"

set :scm, :git
set :user, "auctioneer"
set :deploy_to, "/home/#{application}/app"
set :deploy_via, :remote_cache

require 'bundler/capistrano'

#If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    #run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
