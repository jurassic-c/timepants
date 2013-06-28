require 'capistrano/ext/multistage'

set :application, "timepants"
set :repository,  "https://github.com/jurassic-c/timepants.git"

set :scm, :git
set :user, "iverticle"

set :stages, ["staging", "production"]
set :default_stage, "staging"

set :use_sudo, false

set :normalize_asset_timestamps, false