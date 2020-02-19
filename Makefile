include local.env

login-quayio:
	docker login quay.io

docker-build:
	docker build -t quay.io/${QUAYIO_USERNAME}/${APP_NAME} .

docker-run:
	docker run -d -p ${PORT}:${PORT} quay.io/${QUAYIO_USERNAME}/${APP_NAME}

docker-list:
	docker ps -l

docker-stop:
	docker stop $$(docker ps -a -q)

docker-remove: docker-stop
	docker rm $$(docker ps -a -f status=exited -f status=created -q)

docker-push:
	docker push quay.io/${QUAYIO_USERNAME}/${APP_NAME}

docker-setup: login-quayio docker-build docker-push docker-run