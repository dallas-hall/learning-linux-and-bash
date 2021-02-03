#!/usr/bin/env bash

set -euo pipefail

OLD_IFS=$IFS
FILE=hosts
hosts=()

while IFS="" read -r line || [ -n "$line" ]
do
  if [[ "$line" =~ ^.*[-]+.*$ ]]; then
	# Get hostname and store in the array
	host=$(echo "$line" | cut -d ':' -f 1)

	# Get port range and replace - with .. so we can expand with {}
	range=$(echo "$line" | cut -d ':' -f 2 | sed -r 's/-/../g')

	# Expand into full port range
	cmd=$(echo {"$range"})
	ports=$(eval "echo $cmd")

	# Combine host and expanded ports - https://stackoverflow.com/a/15988793
	# After this command, the IFS (space here) resets back to its previous value we set above
	mapfile -td \  ports_array <<<"$ports"
	ports_array=("${ports_array[@]%$'\n'}")   # drop '\n' added by '<<<'

	# Loop through the array of ports - - https://stackoverflow.com/a/15988793
	for port in "${ports_array[@]}" ;do
	  current_host=("$host"/"$port")
	  #printf "%s\n" "$current_host"
      hosts+=("$current_host")
      done

  else
	current_host=$(echo "$line" | sed -r 's|:|/|g')
	#printf "%s\n" "$current_host"
	hosts+=("$current_host")
  fi
done < $FILE

# Execute the connection test for all the hosts and ports
for i in "${hosts[@]}"; do
	cmd="< /dev/tcp/$i && echo 'Port is open' || echo 'Port is closed'"
	printf "Executing %s\n" "$cmd"
	eval $cmd
done

