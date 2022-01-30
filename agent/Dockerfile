FROM ubuntu:focal

ARG APP_USER="ansible"
ARG APP_GROUP="${APP_USER}"
ARG APP_UID="1000"
ARG APP_GID="${APP_UID}"
ARG APP_DIR="/app"

ARG DEBIAN_FRONTEND=noninteractive

ENV APP_USER="${APP_USER}"

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install openssh-server sudo -y

RUN groupadd -g "${APP_GID}" "${APP_GROUP}" && \
    useradd -g "${APP_GID}" -u "${APP_UID}" -s /bin/bash -m -d "${APP_DIR}" "${APP_USER}"

RUN mkdir /run/sshd && \
    chmod 755 /run/sshd && \
    sed "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" -i /etc/ssh/sshd_config && \
    echo "${APP_USER} ALL=(ALL) NOPASSWD:ALL" >"/etc/sudoers.d/${APP_USER}"

WORKDIR "${APP_DIR}"

COPY --chown="${APP_USER}":"${APP_GROUP}" ./entrypoint.sh .

USER "${APP_USER}"

ENTRYPOINT ["/bin/bash", "./entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D"]