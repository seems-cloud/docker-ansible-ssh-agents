#!/bin/bash

echo "root:${AGENT_ROOT_PASS}" | sudo -i chpasswd
echo "Password set for user 'root'.."

echo "${APP_USER}:${AGENT_APP_PASS}" | sudo -i chpasswd
echo "Password set for user '${APP_USER}'.."

sudo -u root "$@"