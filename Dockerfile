FROM mcr.microsoft.com/powershell:ubuntu-16.04

# This is the release of Consul to pull in.
ENV CONSUL_VERSION=1.3.0

# This is the location of the releases.
ENV HASHICORP_RELEASES=https://releases.hashicorp.com

# Set up certificates, base tools, and Consul.
RUN apt-get update && apt-get install wget -y && apt-get install unzip -y && \
    wget ${HASHICORP_RELEASES}/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip && \
    unzip -d /bin consul_${CONSUL_VERSION}_linux_amd64.zip && \
    cd /tmp && \
    rm -rf /tmp/build && \
    rm -rf /root/.gnupg && \
# tiny smoke test to ensure the binary we downloaded runs
    consul version