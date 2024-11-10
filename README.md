# Talos Cluster

## Create all the necessary files

1. Create the secrets file with:

```bash
talosctl gen secrets --output-file secrets.yaml
```

2. Create the config file with:

```bash
talosctl gen config oracle https://141.147.26.197:6443 --additional-sans 141.147.26.197 --with-secrets secrets.yaml
```

3. Decrypt the secrets using `sops` and `age`:

```bash
sops -e -i secrets.yaml
sops -e -i worker.yaml
sops -e -i controlplane.yaml
sops -e -i --input-type yaml --output-type yaml talosconfig
```
