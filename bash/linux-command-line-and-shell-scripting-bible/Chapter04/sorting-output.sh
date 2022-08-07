echo "[INFO] The sort command has various options to sort large outputs."
echo "[INFO] By default it treats numbers as characters, to change this use -n or -h"
echo "$ sort -n filename"
echo "$ sort -h filename-with-human-readable-numbers"
echo "$ df -h | sort -t ' ' -k 3 -h"
df -h | sort -t ' ' -k 3 -h
echo -e "\n[INFO] -t and -k can be used for data with delimiters and fields."
echo "[INFO] -r can be used to going into descending order. Ascending is default."
echo "$ df -h | sort -t ' ' -k 3 -hr"
df -h | sort -t ' ' -k 3 -hr
