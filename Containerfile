FROM registry.fedoraproject.org/fedora-toolbox:39

COPY packages /tmp
RUN dnf update -y && dnf install -y $(cat /tmp/packages)

RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc && sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
RUN dnf check-update && dnf install -y code

RUN dnf clean all
