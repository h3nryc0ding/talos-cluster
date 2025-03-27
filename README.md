# Kubernetes Talos Cluster

## Repository Structure

```
.
├── controlplane.yaml           # Control plane node configuration
├── worker.yaml                 # Worker node configuration
├── secrets.yaml                # Encrypted secrets file
├── patches/                    # Talos configuration patches
│   ├── alpha-installer.yaml
│   ├── controlplane-scheduling.yaml
│   ├── disable-default-cni.yaml
│   ├── disable-kube-proxy.yaml
│   └── openeps-mount.yaml
├── kubeconfig                  # Kubernetes cluster access
└── talosconfig                 # Talos cluster configuration
```

## Key Components

### Configuration Files
- `controlplane.yaml`: Control plane node configuration
- `worker.yaml`: Worker node configuration
- `talosconfig`: Talos cluster access configuration
- `kubeconfig`: Kubernetes cluster access

### Patches
- `alpha-installer.yaml`: Use alpha Talos installer
- `controlplane-scheduling.yaml`: Allow control plane workload scheduling
- `disable-default-cni.yaml`: Disable default Container Network Interface
- `disable-kube-proxy.yaml`: Disable default kube-proxy
- `openeps-mount.yaml`: Mount OpenEPS volume

## Secrets Management

This repository uses Sops for secrets encryption. Ensure `SOPS_AGE_KEY_FILE` is set to the private key path.

### Sops Commands
```bash
# Edit secrets
sops edit secrets.yaml

# Check the encryption status
sops filestatus secrets.yaml

# Encrypt secrets
sops encrypt secrets.yaml

# Decrypt secrets
sops decrypt secrets.yaml
```
Specify the `--input-type yaml --output-type yaml` flags when using `sops` with YAML files which don't have the `.yaml` extension.

Use `--in-place` flag to modify files directly when making significant changes.
