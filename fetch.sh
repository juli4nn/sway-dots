#!/usr/bin/env bash

# --- cpu ---
cpuname=$(lscpu | awk -F: '/Model name/ {gsub(/^ +/, "", $2); print $2}')

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
