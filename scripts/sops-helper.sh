#!/usr/bin/env bash
set -euo pipefail
# Configuration
FILES=(controlplane.yaml worker.yaml secrets.yaml talosconfig kubeconfig)
KEY_FILE=${SOPS_AGE_KEY_FILE:-key.agekey}

# Check if key file exists
[ -f "$KEY_FILE" ] || { echo "Error: Key file $KEY_FILE not found"; exit 1; }
echo "Using key file: $KEY_FILE"

# Export the key file for SOPS to use
export SOPS_AGE_KEY_FILE="$KEY_FILE"

# Determine operation based on script name
OP=$(basename "$0" | cut -d. -f1)

readonly FLAGS="--in-place --mac-only-encrypted --input-type yaml --output-type yaml"

# Process files based on operation
echo "Starting $OP operation on files: ${FILES[*]}"
for file in "${FILES[@]}"; do
    case $OP in
        encrypt)
            sops -e $FLAGS "$file" && echo "Encrypted $file"
            ;;
        decrypt)
            sops -d $FLAGS "$file" && echo "Decrypted $file"
            ;;
        *)
            echo "Usage: $0 must be named encrypt.sh or decrypt.sh"
            exit 1
            ;;
    esac
done
