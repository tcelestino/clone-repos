#!/bin/bash

convert_to_ssh() {
    local url="$1"
    if [[ "$url" == git@* ]]; then
        echo "$url"
        return
    fi
    url=$(echo "$url" | sed -E 's#^https?://([^/]+)/(.+)$#git@\1:\2#')
    echo "$url"
}

if [ $# -eq 0 ]; then
    echo "Please provide the repository list file."
    echo "Usage: $0 repos_file.txt [target_directory]"
    echo "If target_directory is not provided, ~/Projects will be used"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "File $1 not found!"
    exit 1
fi

PROJECTS_DIR="${2:-$HOME/Projects}"
mkdir -p "$PROJECTS_DIR"
echo "Repositories will be cloned to: $PROJECTS_DIR"

while IFS= read -r repo; do
    [[ -z "$repo" || "$repo" =~ ^[[:space:]]*# ]] && continue

    ssh_url=$(convert_to_ssh "$repo")
    echo "Cloning repository: $ssh_url"
    git clone "$ssh_url" "$PROJECTS_DIR/$(basename "${ssh_url%.git}" .git)"
done < "$1"

echo "Cloning process completed!"
