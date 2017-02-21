FROM alpine:3.5
MAINTAINER "John Hazelwood" <jhazelwo@users.noreply.github.com>
RUN apk update && \
    apk upgrade && \
    apk add git openssh
RUN install -d -m 0700 -o 1000 -g 1000 /git /git/.ssh
RUN adduser -u 1000 -g 1000 -h /git -D -H -s /bin/sh git
RUN passwd -u git
COPY spool/ tmp/
RUN install -m 0600 -o 0 -g 0 /tmp/sshd_config /etc/ssh/
RUN install -m 0600 -o 1000 -g 1000 /tmp/authorized_keys /git/.ssh/
RUN /usr/bin/ssh-keygen -A
EXPOSE 2222
RUN su - git -c 'git init --bare /git/repo.git'
CMD /usr/sbin/sshd -De 2>&1
