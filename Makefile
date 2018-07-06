SHELL := bash
REPO ?= imma/ubuntu
TAG ?= $(shell basename $(shell pwd))

docker:
	docker build --no-cache -t $(REPO):$(TAG) .

virtualbox:
	box build $(PWD)/packer.json virtualbox
