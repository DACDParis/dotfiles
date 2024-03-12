
#!/bin/bash

# Find the path to polkit-gnome-authentication-agent-1
polkit_path=$(find /nix/store -type f -name "polkit-gnome-authentication-agent-1" -print -quit)

# Check if the executable is found
if [ -n "$polkit_path" ]; then
    # Execute polkit-gnome-authentication-agent-1 with any arguments passed to this script
    "$polkit_path" "$@"
else
    echo "polkit-gnome-authentication-agent-1 not found in /nix/store."
fi
