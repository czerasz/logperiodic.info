# logperiodic.info

## Development installation

### Clone the project to your users `web-projects` directory:

	mkdir -p ~/web-projects/logperiodic.info
	cd ~/web-projects/logperiodic.info
	git clone git@github.com:czerasz/logperiodic.info.git

### Apache configuration

Create a link of the apache config file into the apache's sites-available directory:

	cd /etc/apache2/sites-available/
	ln -s ~/web-projects/logperiodic.info/config/apache/development.logperiodic.info logperiodic.info

Next create a symlink of this file into the apache's sites-enabled directory:

	cd /etc/apache2/sites-enabled/
	sudo ln -s ../sites-available/logperiodic.info

Create a directory for logfiles:

	sudo mkdir /var/log/apache2/logperiodic.info

Restart apache:

	sudo /etc/init.d/apache2 restart

Add the following line to the `/etc/hosts` file:

	127.0.0.1 www.logperiodic.local logperiodic.local

### Other environments apache configuration

Apache configuration files for other environments can be found [here](https://github.com/czerasz/logperiodic.info/tree/master/config/apache).

## Deployment

The deployment of this application is done via `capistrano`. For more information about `capistrano` please refer to it's [github project](https://github.com/capistrano/capistrano).

For this feature a ruby environment with either `capistrano` or `bundler` is required.
If You don't have `capistrano` installed use `bundle install` to install it.

The project has an `.rvmrc` file which helps, if you don't want `capistrano` in your global gem scope.

### Preparing servers environment

Before deploing the first time use:
	
	cap $ENVIRONMENT deploy:setup

Where $ENVIRONMENT is one of the four environments: testing, master, release, production

### Application deployment

After that deploy the application with:

	cap $ENVIRONMENT deploy

Where $ENVIRONMENT is one of the four environments: testing, master, release, production