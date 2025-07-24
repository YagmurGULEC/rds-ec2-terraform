#!/bin/bash
set -e

echo "Setting up bastion host..."

export de_project="rds-bastion"
export AWS_DEFAULT_REGION="us-east-1"

# Define the variables to manage
declare -A TF_VARS=(
  ["TF_VAR_project_name"]="$de_project"
  ["TF_VAR_region"]="$AWS_DEFAULT_REGION"
  ["TF_VAR_availability_zone_1"]="us-east-1a"
  ["TF_VAR_availability_zone_2"]="us-east-1b"

  ["TF_VAR_ami_id"]="ami-0cbbe2c6a1bb2ad63"
  ["TF_VAR_key_name"]="new-key"
  ["TF_VAR_db_username"]="admin"
  ["TF_VAR_db_password"]="password123"
  ["TF_VAR_db_name"]="mydatabase"
)

for var in "${!TF_VARS[@]}"; do
    value="${TF_VARS[$var]}"
    if grep -q "^export $var=" "$HOME/.bashrc"; then
        sed -i "s|^export $var=.*|export $var=$value|" "$HOME/.bashrc"
    else
        echo "export $var=$value" >> "$HOME/.bashrc"
    fi
done

# Source updated .bashrc to make changes available immediately in this shell
source "$HOME/.bashrc"

# Disable immediate exit for future errors (optional, depending on your needs)
set +e
