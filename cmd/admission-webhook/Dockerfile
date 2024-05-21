ARG ARCH=${TARGETARCH}
ARG OS="linux"
FROM quay.io/prometheus/busybox-${OS}-${ARCH}:latest

COPY admission-webhook /bin/admission-webhook

USER nobody

ENTRYPOINT ["/bin/admission-webhook"]
