FROM alpine:latest

ARG GUIX_VER=1.4.0

ENV PATH /root/.guix-profile/bin:$PATH

RUN cd /tmp
RUN wget https://ftpmirror.gnu.org/gnu/guix/guix-binary-${GUIX_VER}.x86_64-linux.tar.xz
RUN tar xJf guix-binary-${GUIX_VER}.x86_64-linux.tar.xz
RUN mv var/guix /var/ && mv gnu /
RUN ln -sf /var/guix/profiles/per-user/root/current-guix /root/.guix-profile
RUN guix archive --authorize < /root/.guix-profile/share/guix/ci.guix.gnu.org.pub
RUN addgroup --system guixbuild
RUN for i in $(seq -w 1 10); \
    do \
    adduser -g guixbuild -G guixbuild --system \
            -h /var/empty -s $(which nologin) \
            guixbuilder$i;\
    done;
RUN guix-daemon --build-users-group=guixbuild --max-jobs=10 & \
    GUIX_DAEMON=$! ; \
    guix install glibc-locales emacs ; \
    guix pull -c 4 -M 10 ; \
    guix package -u ; \ 
    kill -9 $GUIX_DAEMON

CMD guix-daemon --build-users-group=guixbuild --max-jobs=10 & bash





