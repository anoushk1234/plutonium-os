#! /bin/sh


# Check for the presence of --ssh or --nossh flags
if [[ "$1" == "--ssh" ]]; then
    # Check if exactly three arguments are provided
    if [ "$#" -ne 4 ]; then
        echo "Usage: $0 --ssh <host> <remote_path> <local_path>"
        exit 1
    fi

    # Assign arguments to variables
    host=$2
    remote_path=$3
    local_path=$4

    # Example operation (e.g., using scp)
    echo "Using SSH to copy file from $host:$remote_path to $local_path"
    scp "$host:$remote_path" "$local_path" && qemu-system-i386 -cdrom $local_path

elif [[ "$1" == "--nossh" ]]; then
    # Check if exactly one argument is provided
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 --nossh <file_path>"
        exit 1
    fi

    # Assign argument to variable
    file_path=$2

    # Example operation without SSH
    echo "Handling file locally at $file_path"

    qemu-system-i386 -nographic -display curses -cdrom $file_path
else
    echo "Usage: $0 --ssh <host> <remote_path> <local_path> | --nossh <file_path>"
    exit 1
fi

