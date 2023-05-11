FROM registry.fedoraproject.org/fedora-toolbox:38

COPY packages /tmp

RUN dnf update -y && dnf install -y $(cat /tmp/packages)

RUN dnf clean all
