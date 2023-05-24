FROM registry.fedoraproject.org/fedora-toolbox:38

COPY packages /tmp

RUN dnf update -y && dnf install -y $(cat /tmp/packages)

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 20

#RUN dnf clean all
