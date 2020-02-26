login-quayio:
	docker login -u="acosta+bff_prototype_robot" -p="GR8OSPI9X8VZJKDY4EHRH6DWYRKCFQ2QAGVMXT252WYMG8O44ICTXY3Y81RDUMX3" quay.io

docker-build:
	docker build -t quay.io/acosta/bff-prototype .

docker-run:
	docker run -d -p 3000:3000 quay.io/acosta/bff-prototype

docker-list:
	docker ps -l

docker-stop:
	docker stop $$(docker ps -a -q)

docker-remove: docker-stop
	docker rm $$(docker ps -a -f status=exited -f status=created -q)

docker-push:
	docker push quay.io/acosta/bff-prototype

docker-setup: login-quayio docker-stop docker-remove docker-build docker-push docker-run

example-test:
	npm install-test

example-test-1:
	npm install-test