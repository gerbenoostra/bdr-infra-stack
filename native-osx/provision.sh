#!/usr/bin/env bash
ansible-playbook -i inventory/localhosts_inv provision.yml "$@"