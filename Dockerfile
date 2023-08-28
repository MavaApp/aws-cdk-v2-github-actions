FROM alpine:3.18

RUN apk --update --no-cache add \
	nodejs~18 \
	npm \
	python3 \
	py3-pip \
	jq \
	curl \
	bash \
	git \
	docker && \
	ln -sf /usr/bin/python3 /usr/bin/python

COPY --from=golang:alpine /usr/local/go/ /usr/local/go/
ENV PATH="/usr/local/go/bin:${PATH}"

COPY entrypoint.sh /entrypoint.sh

ENV INPUT_CDK_VERSION="2.92.0"

ENTRYPOINT ["/entrypoint.sh"]
