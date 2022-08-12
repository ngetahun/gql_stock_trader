NAME=gql_learning_server

build: Dockerfile
	docker build -t ${NAME}:latest .

run:
	docker run -p 4000:4000 --env $$(cat .env | xargs) -d -i ${NAME}
	sleep 2

stop:
	docker stop $$(docker ps -a -q --filter ancestor=${NAME} --format="{{.ID}}")

clean:
	docker rm $$(docker ps -a -q --filter ancestor=${NAME} --format="{{.ID}}")

debug:
	docker exec -it $$(docker ps | egrep 'gql_learning_server\s' | awk '{ print $$1 }') /bin/bash

ip:
	echo $$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $$(docker ps | grep '${NAME} ' | awk '{ print $$1 }'))

logs:
	docker logs $$(docker ps -a -q --filter ancestor=${NAME} --format="{{.ID}}")
