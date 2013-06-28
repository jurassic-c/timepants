require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :default_shell, '/bin/bash -l'

set :application, "timepants"
set :repository,  "https://github.com/jurassic-c/timepants.git"

set :scm, :git
set :user, "iverticle"

set :stages, ["staging", "production"]
set :default_stage, "staging"

set :use_sudo, false

set :normalize_asset_timestamps, false

namespace :deploy do
	task :start, :roles => :app do
		run "cd #{current_path}; rails server -d"
	end

	task :stop, :roles => :app do
	    run "cd #{current_path}; kill -9 $(cat tmp/pids/server.pid)"
	end

	task :restart, :roles => :app do
		run "cd #{current_path}; kill -9 $(cat tmp/pids/server.pid); rails server -d"
	end
end