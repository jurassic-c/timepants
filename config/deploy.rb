require 'capistrano/ext/multistage'

set :default_shell, '/bin/bash -l'

set :application, "timepants"
set :repository,  "https://github.com/jurassic-c/timepants.git"

set :scm, :git
set :user, "iverticle"

set :stages, ["staging", "production"]
set :default_stage, "staging"

set :use_sudo, false

set :normalize_asset_timestamps, false

namespace :bundle do

  desc "run bundle install and ensure all gem requirements are met"
  task :install do
    run "cd #{current_path} && bundle install  --without=test"
  end

end
before "deploy:restart", "bundle:install"