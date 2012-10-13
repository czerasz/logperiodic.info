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