ARG ARCH=${TARGETARCH}
ARG OS="linux"
FROM quay.io/prometheus/busybox-${OS}-${ARCH}:latest

COPY prometheus-config-reloader /bin/prometheus-config-reloader

USER nobody

ENTRYPOINT ["/bin/prometheus-config-reloader"]
