# deploy: build
# 	scp -r ./public/ root@chuidylan:/var/www/html/

deploy:	docker-push
	ssh root@chuidylan << EOF
		docker pull xuzhijian/myblog
		docker stop myblog
		docker rm myblog
		docker run --name myblog -v /etc/letsencrypt:/etc/letsencrypt -p 80:80 -p 443:443 -d xuzhijian/myblog
		exit
		EOF

build: clean
	hugo

clean:
	rm -rf ./public

docker-build: build
	docker build --no-cache -t xuzhijian/myblog .

docker-push: docker-build
	docker push xuzhijian/myblog

.PHONY: deploy build clean docker-push docker-build
