FROM alpine:3.20

RUN apk add --no-cache bash busybox-extras bind-tools curl jq openssh vim

USER 65534

ENTRYPOINT ["/bin/bash"]
