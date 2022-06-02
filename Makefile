help:
	@echo ""
	@echo "Make (action)"
	@echo "	help	Displays this message"
	@echo "	build	Create a new docker container"
	@echo "	run	Runs the docker container"
	@echo "	bash	Access /bin/bash of the container"
	@echo ""
build:
	@echo "Building..."
	docker build . -t mkdocs
run:
	@echo "Running..."
	docker run -it -d -v $(pwd):/home/developer -p 8000:8000 mkdocs
bash:
	docker exec -it mkdocs /bin/bash

