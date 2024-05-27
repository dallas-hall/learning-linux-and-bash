echo "[INFO] du command can show how much space each file and directory uses. By default is uses the current working directory and recursively walks it." 
echo "$ du"
cd du

echo -e "\n[INFO] du can show a summary of the current working directory."
echo "$ du -s"
du -s

echo -e "\n[INFO] use -h for human readable output."
echo "$ du -sh"
du -sh

echo -e "\n[INFO] du output can be used with other commands to find the top N size using files or folders. This example shows the top 20 largest folders in the home directory."
echo "$ du ~ -h --max-depth 1 | sort -hr | head -n 20"
du ~ -h --max-depth 1 | sort -hr | head -n 20
