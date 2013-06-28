require 'capistrano/ext/multistage'

set :application, "timepants"
set :repository,  "https://github.com/jurassic-c/timepants.git"

set :scm, :git

set :stages, ["staging", "production"]
set :default_stage, "staging"