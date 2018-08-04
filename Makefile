deploy: build
	scp -r ./public/ root@chuidylan:/var/www/html/blog/

build: clean
	hugo

clean:
	rm -rf ./public

.PHONY: deploy build clean
