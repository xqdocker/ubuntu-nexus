REPOSITORY = xqdocker/ubuntu-nexus
VERSION = ${version}

build:
	cd "${VERSION}" && \
	docker build -t $(REPOSITORY) .

release: build
	docker tag $(REPOSITORY):$(VERSION)
	docker push $(REPOSITORY):$(VERSION)
