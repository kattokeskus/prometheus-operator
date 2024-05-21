variable "TAG" {
    default = "latest"
}

variable "OS" {
    default = "linux"
}

variable "IMAGE_OPERATOR" {
    default = "quay.io/prometheus-operator/prometheus-operator"
}

variable "IMAGE_RELOADER" {
    default = "quay.io/prometheus-operator/prometheus-config-reloader"
}

variable "IMAGE_WEBHOOK" {
    default = "quay.io/prometheus-operator/admission-webhook"
}

group "default" {
    targets = [
        "prometheus-operator", "prometheus-config-reloader", "admission-webhook",
        "prometheus-operator-combined", "prometheus-config-reloader-combined", "admission-webhook-combined",
    ]
}

target "prometheus-operator" {
    name = "prometheus-operator-${arch}"
    matrix = {
        arch = ["amd64", "arm64"]
    }
    platforms = ["linux/${arch}"]
    context = "."
    args = {
        OS = "${OS}"
    }
    tags = [
        "${IMAGE_OPERATOR}:${arch}",
        "${IMAGE_OPERATOR}:${arch}-latest",
        "${IMAGE_OPERATOR}:${arch}-${TAG}",
    ]
    labels = {
        "org.opencontainers.image.source" = "https://github.com/kattokeskus/prometheus-operator",
        "org.opencontainers.image.description" = "Prometheus Operator",
    }
    output = ["type=docker"]
}

target "prometheus-operator-combined" {
    platforms = ["linux/amd64", "linux/arm64"]
    context = "."
    args = {
        OS = "${OS}"
    }
    tags = [
        "${IMAGE_OPERATOR}:latest",
        "${IMAGE_OPERATOR}:${TAG}",
    ]
    annotations = [
        "org.opencontainers.image.source=https://github.com/kattokeskus/prometheus-operator",
        "org.opencontainers.image.description=Prometheus Operator",
    ]
    labels = {
        "org.opencontainers.image.source" = "https://github.com/kattokeskus/prometheus-operator",
        "org.opencontainers.image.description" = "Prometheus Operator",
    }
}


target "prometheus-config-reloader" {
    name = "prometheus-config-reloader-${arch}"
    matrix = {
        arch = ["amd64", "arm64"]
    }
    platforms = ["linux/${arch}"]
    context = "."
    dockerfile = "cmd/prometheus-config-reloader/Dockerfile"
    args = {
        OS = "${OS}"
    }
    tags = [
        "${IMAGE_RELOADER}:${arch}",
        "${IMAGE_RELOADER}:${arch}-latest",
        "${IMAGE_RELOADER}:${arch}-${TAG}",
    ]
    labels = {
        "org.opencontainers.image.source" = "https://github.com/kattokeskus/prometheus-operator",
        "org.opencontainers.image.description" = "Prometheus Config Reloader",
    }
    output = ["type=docker"]
}

target "prometheus-config-reloader-combined" {
    platforms = ["linux/amd64", "linux/arm64"]
    context = "."
    args = {
        OS = "${OS}"
    }
    tags = [
        "${IMAGE_RELOADER}:latest",
        "${IMAGE_RELOADER}:${TAG}",
    ]
    annotations = [
        "org.opencontainers.image.source=https://github.com/kattokeskus/prometheus-operator",
        "org.opencontainers.image.description=Prometheus Config Reloader",
    ]
    labels = {
        "org.opencontainers.image.source" = "https://github.com/kattokeskus/prometheus-operator",
        "org.opencontainers.image.description" = "Prometheus Config Reloader",
    }
}

target "admission-webhook" {
    name = "admission-webhook-${arch}"
    matrix = {
        arch = ["amd64", "arm64"]
    }
    platforms = ["linux/${arch}"]
    context = "."
    dockerfile = "cmd/admission-webhook/Dockerfile"
    args = {
        OS = "${OS}"
    }
    tags = [
        "${IMAGE_WEBHOOK}:${arch}",
        "${IMAGE_WEBHOOK}:${arch}-latest",
        "${IMAGE_WEBHOOK}:${arch}-${TAG}",
    ]
    labels = {
        "org.opencontainers.image.source" = "https://github.com/kattokeskus/prometheus-operator",
        "org.opencontainers.image.description" = "Prometheus Admission Webhook",
    }
    output = ["type=docker"]
}

target "admission-webhook-combined" {
    platforms = ["linux/amd64", "linux/arm64"]
    context = "."
    args = {
        OS = "${OS}"
    }
    tags = [
        "${IMAGE_WEBHOOK}:latest",
        "${IMAGE_WEBHOOK}:${TAG}",
    ]
    annotations = [
        "org.opencontainers.image.source=https://github.com/kattokeskus/prometheus-operator",
        "org.opencontainers.image.description=Prometheus Admission Webhook",
    ]
    labels = {
        "org.opencontainers.image.source" = "https://github.com/kattokeskus/prometheus-operator",
        "org.opencontainers.image.description" = "Prometheus Admission Webhook",
    }
}