help:
	@echo ""
	@echo "Make (action)"
	@echo "	help	Displays this message"
	@echo "	build	Create a new docker container"
	@echo "	run	Runs the docker container"
	@echo "	serve   Serves the web application in port 8000"
	@echo "	bash	Access /bin/bash of the container"
	@echo "	connect	Connect container to developer-net in case of need for other containers"
	@echo "	kill	Kill mkdocs running container"
	@echo "	destroy	Destroys mkdocs container"
	@echo ""
build:
	@echo "Building..."
	docker build . -t mkdocs
run:
	@echo "Running..."
	docker start mkdocs || \
	docker run -it -d -v $(pwd):/home/developer \
	-p 8000:8000 \
	--name mkdocs mkdocs
serve:
	docker exec -it mkdocs mkdocs serve -a 0.0.0.0:8000
bash:
	docker exec -it mkdocs /bin/bash
connect:
	docker network connect developer-net mkdocs
kill:
	docker kill mkdocs
destroy:
	docker rm mkdocs
