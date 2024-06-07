FROM alpine:3.7

RUN apk update

# Install necessary packages
RUN apk --no-cache add \
    curl \
    bash \
    gnupg \
    ca-certificates

# Install kubectl
RUN curl -LO --insecure https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubectl \
    && mv kubectl /usr/local/bin \
    && chmod +x /usr/local/bin/kubectl

RUN mkdir /root/.kube

# Install psql client
RUN apk --no-cache add postgresql-client

# Install redis-cli
RUN apk --no-cache add redis

# Set the entrypoint to launch a shell
ENTRYPOINT [ "bash" ]
