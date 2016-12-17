#!/usr/bin/env bash
echo "give 1 argument, the name of the conda env, to create the kernel"
echo "Creating jupyter kernel for conda env $1"
ansible-playbook -i inventory/localhosts_inv spark_kernels.yml --extra-vars "spark_client_conda_env=$1"
