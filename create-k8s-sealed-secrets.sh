#!/usr/bin/env bash
SECRET_NAME=my-secret
NAMESPACE_NAME=default

# map from https://stackoverflow.com/a/3467959
declare -A MY_SECRETS
MY_SECRETS["key1"]="value1"
MY_SECRETS["key2"]="value2"
MY_SECRETS["key3"]="value3"

# $() from https://stackoverflow.com/a/54030020
cat << EOF | kubectl create -f - --dry-run -o yaml | kubeseal -o yaml > "$SECRET_NAME".yaml
apiVersion: v1
kind: Secret
metadata:
  name: $SECRET_NAME
  namespace: $NAMESPACE_NAME
type: Opaque
stringData:
$(
  for KEY in "${!MY_SECRETS[@]}"; do echo "  $KEY": "${MY_SECRETS[$KEY]}"; done
 )
EOF

