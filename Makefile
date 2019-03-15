# deploy: build
# 	scp -r ./public/ root@chuidylan:/var/www/html/

deploy:	docker-push
	ssh root@chuidylan "docker pull xuzhijian/myblog ; docker restart myblog ; exit"

build: clean
	hugo

clean:
	rm -rf ./public

docker-build: build
	docker build -t xuzhijian/myblog .

docker-push: docker-build
	docker push xuzhijian/myblog

.PHONY: deploy build clean docker-push docker-build
