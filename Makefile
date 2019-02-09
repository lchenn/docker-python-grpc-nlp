DOCKER_HOST   := docker.io
DOCKER_USER := lchenn
ARTIFACT := python3-grpc-nlp

FULL_NAME   := ${DOCKER_HOST}/${DOCKER_USER}/${ARTIFACT}
GIT_HASH    := $$(git log -1 --pretty=%h)
LATEST := latest
VERSION := 1.0.4

.PHONY: build push login

build:
	@docker build -t $(FULL_NAME):${GIT_HASH} .
	@docker tag $(ARTIFACT):${GIT_HASH} ${FULL_NAME}:${LATEST}
	@docker tag $(ARTIFACT):${GIT_HASH} ${FULL_NAME}:${VERSION}

push: login
	@docker push ${FULL_NAME}:${GIT_HASH}
	@docker push ${FULL_NAME}:${LATEST}
	@docker push ${FULL_NAME}:${VERSION}

login:
	@docker login --username $(DOCKER_USER) --password ${DOCKER_PASSWORD}
