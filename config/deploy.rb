set :application, "logperiodic.info"

set :user, "deployer" # <-- Set this to your deployment user
set :shell, "/bin/bash"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:czerasz/logperiodic.info.git"
ssh_options[:forward_agent] = true # Agent Forwarding
set :keep_releases, 5

desc "Setup deployment variables for the production environmet"
task :production do
	role :app, 'logperiodic.host' # <-- Set this to your deployment host
	set :environment, "production"
	set :deploy_to, "~/web-projects/#{application}"

	set :branch, "release"
end

desc "Setup deployment variables for the release environmet"
task :release do
	role :app, 'logperiodic.host' # <-- Set this to your deployment host
	set :environment, "release"
	set :deploy_to, "~/web-projects/#{environment}/#{application}"

	set :branch, "release"
end

desc "Setup deployment variables for the master environmet"
task :master do
	role :app, 'logperiodic.host' # <-- Set this to your deployment host
	set :environment, "master"
	set :deploy_to, "~/web-projects/#{environment}/#{application}"

	set :branch, "master"
end

desc "Setup deployment variables for the testing environmet"
task :testing do
	role :app, 'logperiodic.host' # <-- Set this to your deployment host
	set :environment, "testing"
	set :deploy_to, "~/web-projects/#{environment}/#{application}"

	set :branch, "testing"
end

namespace :deploy do
	task :setup, :except => { :no_release => true } do
		# This task was overridden because
		# for a php app we don't need a standard Rails app shared structure
    dirs = [deploy_to, releases_path, shared_path]
    run "#{try_sudo} mkdir -p #{dirs.join(' ')}"
  end

	task :finalize_update do
    puts "    not doing finalize_update because not a Rails application."
  end

	task :start, :roles => :app do
		puts "    not doing start because not a Rails application."
	end

	task :stop, :roles => :app do
		puts "    not doing stop because not a Rails application."
	end

	task :restart, :roles => :app do
		puts "    not doing restart because not a Rails application."
		# no restart required for Apache/mod_php
	end
end