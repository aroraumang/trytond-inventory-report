test: test-sqlite test-postgres test-flake8

test-sqlite: install-dependencies install-wkhtmltopdf
	coverage run setup.py test
	coverage report -m --fail-under 100

test-postgres: install-dependencies install-wkhtmltopdf
	python setup.py test_on_postgres

test-flake8:
	pip install flake8
	flake8 .

install-dependencies:
	CFLAGS=-O0 pip install lxml
	pip install -r dev_requirements.txt

install-wkhtmltopdf:
	sudo apt-get install -y openssl build-essential xorg libssl-dev libxrender-dev wget xvfb fontconfig cabextract xfonts-75dpi
	wget http://citylan.dl.sourceforge.net/project/wkhtmltopdf/0.12.2/wkhtmltox-0.12.2_linux-trusty-amd64.deb
	dpkg -i wkhtmltox-0.12.2_linux-trusty-amd64.deb
