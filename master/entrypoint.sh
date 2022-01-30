#!/bin/bash

ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1

sleep 1

# shellcheck disable=SC2153
for HOST in ${REMOTE_HOSTS}; do
  while true; do
    if timeout 1 bash -c "cat < /dev/null > /dev/tcp/${HOST}/22"; then
      break
    else
      echo "Retry.."
    fi
  done

  sshpass -p "${AGENT_APP_PASS}" ssh-copy-id -o "StrictHostKeyChecking=no" -i "ansible@${HOST}"
done

ansible-playbook -i inventories/inventory.yaml roles/common.yml --tags all --limit all

"$@"
