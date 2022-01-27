FROM ubuntu:focal

ARG APP_USER="master"
ARG APP_UID="1000"
ARG APP_GID="1000"
ARG APP_DIR="/app"

ARG DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install python3-pip openssh-client sshpass -y

RUN groupadd -g "${APP_GID}" "${APP_USER}" && \
    useradd -g "${APP_GID}" -u "${APP_UID}" -s /bin/bash -m -d "${APP_DIR}" "${APP_USER}"

RUN pip3 install ansible

COPY ./entrypoint.sh "${APP_DIR}"

WORKDIR "${APP_DIR}"

USER "${APP_USER}"

ENTRYPOINT ["/bin/bash", "./entrypoint.sh"]