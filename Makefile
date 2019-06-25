version = 0.0.1

all: tag_old_image build rm_old_image

build:
	docker build . -t slacktionic:$(version)

tag_old_image:
	-docker tag slacktionic:$(version) slacktionic:$(version)-old 2>/dev/null

rm_old_image:
	-docker rmi slacktionic:$(version)-old 2>/dev/null


clean: stop
	-docker rm slacktionic
	-docker rmi slacktionic:$(version)

run:
	docker run --rm --name slacktionic -v $(pwd):/slacktionic -p 80:9292 slacktionic:$(version)

stop:
	-docker stop slacktionic
