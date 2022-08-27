IMAGE_NAME	?= takekazuomi/sqlboiler
TAG_LATEST	:=	$(shell curl --silent "https://api.github.com/repos/volatiletech/sqlboiler/releases/latest" | \
				grep tag_name | cut -d '"' -f 4)
TAG		?=	$(TAG_LATEST)

help:	## Show this help.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)

build:	## build
	docker build \
		-t $(IMAGE_NAME):$(TAG) \
		--build-arg SQLBOILER_VER=$(TAG) \
		-f Dockerfile .
	docker tag $(IMAGE_NAME):$(TAG) $(IMAGE_NAME):latest


push:	## push
push:	build 
	docker push $(IMAGE_NAME):$(TAG)
	docker push $(IMAGE_NAME):latest

