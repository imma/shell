SHELL := bash
REPO ?= imma/ubuntu
TAG ?= $(shell basename $(shell pwd))

bash:
	@docker run -ti --rm -u ubuntu -w /home/ubuntu -v $(DATA):/data -v /var/run/docker.sock:/var/run/docker.sock $(REPO):$(TAG) bash || true

docker:
	docker build --no-cache -t $(REPO):$(TAG) .

virtualbox:
	box build $(PWD)/packer.json virtualbox
