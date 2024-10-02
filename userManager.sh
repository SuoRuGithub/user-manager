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

# add function
add_users() {
    echo "add users"

}

# delete function
delete_users() {
    echo "delete users"

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
