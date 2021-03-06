# create virtual environment and install dependencies
install:
	virtualenv venv && \
	venv/bin/pip install -r requirements.txt
	mkdir -p ~/.bin
	cp copy ~/.bin/copy

run:
	FLASK_APP=app.py flask run -p 5050
