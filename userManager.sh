#!/bin/bash
# This script is used to manage users on the local system
# Usage: ./userManager.sh [get | add | delete]
CURRENT_DIR=$(pwd)

# get function
get_users() {
    echo "get users info"
    ansible-playbook --ask-become-pass --extra_vars "project_root=CURRENT_DIR" \
        -i inventory/inventory.yaml playbooks/get_users_info.yaml
}

# 每次添加 / 删除用户之前和之后都需要获取用户信息，尽可能保证本地存储的用户信息和远程主机上的用户信息一致

# add function
add_users() {
    echo "add users"
    ansible-playbook --ask-become-pass --extra_vars "project_root=CURRENT_DIR" \
        -i inventory/inventory.yaml playbooks/get_users_info.yaml

    ansible-playbook --ask-become-pass --extra_vars "project_root=CURRENT_DIR" \
        -i inventory/inventory.yaml playbooks/get_users_info.yaml
}

# delete function
delete_users() {
    echo "delete users"
    ansible-playbook --ask-become-pass --extra_vars "project_root=CURRENT_DIR" \
        -i inventory/inventory.yaml playbooks/get_users_info.yaml

    ansible-playbook --ask-become-pass --extra_vars "project_root=CURRENT_DIR" \
        -i inventory/inventory.yaml playbooks/get_users_info.yaml
}

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 [get | add | delete]"
    exit 1
fi
case "$1" in
    get)
        get_users
        ;;
    add)
        add_users
        ;;
    delete)
        delete_users
        ;;
    *)
        echo "Invalid argument."
        exit 1
        ;;
esac
echo "Operation completed"
