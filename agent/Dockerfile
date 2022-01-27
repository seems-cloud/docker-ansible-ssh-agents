FROM ubuntu:focal

ARG APP_USER="ansible"
ARG APP_UID="1000"
ARG APP_GID="1000"
ARG APP_DIR="/app"

ARG DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install openssh-server -y

RUN groupadd -g "${APP_GID}" "${APP_USER}" && \
    useradd -g "${APP_GID}" -u "${APP_UID}" -s /bin/bash -m -d "${APP_DIR}" "${APP_USER}"

RUN mkdir /run/sshd && \
    chmod 755 /run/sshd && \
    sed "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" -i /etc/ssh/sshd_config

COPY ./entrypoint.sh .

CMD ["/bin/bash", "entrypoint.sh"]