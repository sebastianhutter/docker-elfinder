# simple makefile to build the next cloud container
ELFINDER_VERSION = "2.1.22"

# build
# build a new docker image
# the images tag is equal to the installed nextcloud version
.PHONY: build
build:
	docker build --build-arg ELFINDER_VERSION=$(ELFINDER_VERSION) -t sebastianhutter/elfinder:$(ELFINDER_VERSION) .

# latest
# set the latest tag for the image with the specified nextcloud version tag
.PHONY: latest
latest:
	docker build --build-arg ELFINDER_VERSION=$(ELFINDER_VERSION) -t sebastianhutter/elfinder:latest .
# push the build containers
.PHONY: push
push:
		docker push sebastianhutter/elfinder:$(ELFINDER_VERSION)
		docker push sebastianhutter/elfinder:latest