#!/usr/bin/env bash

# --- cpu ---
cpuname=$(lscpu | grep "Model name" | cut -d: -f2- | sed 's/^ *//' | sed 's/ CPU @.*//' | sed 's/ with.*//')

# --- system info ---
user_host="$(whoami)@$(uname -n)"
shell_name=$(basename "$SHELL")
uptime=$(uptime -p | sed 's/up //; s/ minutes/mins/; s/ minute/min/')

# memory (MiB)
read -r total used <<<$(free -m | awk '/Mem:/ {print $2, $3}')

# --- output ---
cat <<EOF
             $user_host
    (\\(\\     -----------
   j". ..    os: linux
   (  . .)   shell: $shell_name
   |   ° ¡   uptime: $uptime
   ¿     ;   ram: $used/$total MiB
   c?".UJ    cpu: $cpuname

EOF
