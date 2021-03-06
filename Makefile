
update:
	bash update.sh

up: update
	docker-compose up --build -d vtiger

.PHONY: debug
debug: up
	docker-compose exec vtiger debug

xdebug: up
	docker-compose logs -f xdebug

test-debug: update
	docker run -t -i --rm -v ${PWD}:/app javanile/vtiger-dev:7.1.0 debug

test-debug-polling: update
	docker run -t -i --rm -v ${PWD}:/app javanile/vtiger-dev:7.1.0 debug --polling

test-xdebug: update
	#docker run -t -i --rm -v ${PWD}:/app javanile/vtiger-dev:7.1.0 cat /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
	#docker run -t -i --rm -v ${PWD}:/app javanile/vtiger-dev:7.1.0 php --ini
	docker run -t -i --rm -v ${PWD}:/app javanile/vtiger-dev:7.1.0

release: update
	bash release.sh
