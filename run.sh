#! /bin/sh






 # Check if --ssh flag is present
use_ssh=false
for arg in "$@"; do
    if [ "$arg" == "--ssh" ]; then
        use_ssh=true
        break
    fi
done

# Remove --ssh flag from the positional parameters if found
if [ "$use_ssh" == true ]; then
    # Shift positional parameters to remove --ssh
    set -- "${@/--ssh/}"
fi

# Check if correct number of arguments is provided when --ssh is used
if [ "$use_ssh" == true ] && [ "$#" -ne 3 ]; then
    echo "Usage: $0 --ssh <host> <remote_path> <local_path>"
    exit 1
fi

if [ "$use_ssh" == true ]; then
    host=$1
    remote_path=$2
    local_path=$3

    echo "Using SSH to copy file from $host:$remote_path to $local_path"
   scp $host:$remote_path $local_path && qemu-system-i386 -cdrom $local_path
else
    echo "No --ssh flag provided. Skipping SSH operations."
    qemu-system-i386 -nographic -display curses -cdrom *.iso
fi

