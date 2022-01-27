#!/bin/bash

echo "ansible:${USER_PASS}" | chpasswd

echo "Password set"

/usr/sbin/sshd -D