SHELL := bash
REPO ?= imma/ubuntu
TAG ?= $(shell basename $(shell pwd))

bash:
	@docker run -ti --rm -u ubuntu -w /home/ubuntu -v $(DATA):/data -v /var/run/docker.sock:/var/run/docker.sock $(REPO):$(TAG) bash || true

docker:
	docker build --no-cache -t $(REPO):$(TAG) .

virtualbox:
	rm -rf ../boxcutter-ubuntu/box/virtualbox/*.box
	box build $(PWD)/packer.json virtualbox
	vagrant box add -f imma/ubuntu-18.04 ../boxcutter-ubuntu/box/virtualbox/ubuntu1804-17.0907.1.box
