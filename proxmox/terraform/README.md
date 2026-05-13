# Proxmox Terraform Configuration

This directory contains Terraform code to provision Proxmox containers using the Telmate/proxmox provider.

## Containers

This configuration creates two Ubuntu LTS containers:

1. **ct-core** (VMID: 100)
   - IP: 192.168.2.2/24
   - 1 CPU cores
   - 512 MB memory

2. **ct-github** (VMID: 101)
   - IP: 192.168.2.6/24
   - 1 CPU cores
   - 512 MB memory

## Prerequisites

- Proxmox VE installed and running
- Terraform >= 1.0
- Proxmox API token with appropriate permissions

## Setup

### 1. Generate Proxmox API Token

In Proxmox Web UI:

- Go to Datacenter → Permissions → API Tokens
- Click Create
- Set User, Token ID, and Privilege Separation
- Copy the generated token

### 2. Configure Terraform Variables (Secrets)

**IMPORTANT: Never commit your actual credentials to GitHub!**

1. Copy the example file:
   ```bash
   cp terraform.tfvars.example terraform.auto.tfvars
   ```

2. Edit `terraform.auto.tfvars` and update with your actual credentials:
   - `pm_api_url`: Your Proxmox API endpoint (https://your-host:8006/api2/json)
   - `pm_api_token_id`: Your token ID (format: user@pam!tokenname)
   - `pm_api_token`: Your token secret
   - Network settings (IPs, bridge, etc.)

3. The `.gitignore` file automatically excludes `terraform.auto.tfvars` from version control

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Validate Configuration

```bash
terraform validate
```

### 5. Plan Deployment

Review the planned changes:
```bash
terraform plan
```

Or save the plan to a file:
```bash
terraform plan -out=tfplan
```

### 6. Apply Configuration

Apply the configuration to create the containers:
```bash
terraform apply
```

Or apply a previously saved plan:
```bash
terraform apply tfplan
```

### 7. Destroy Resources (if needed)

To remove the containers:
```bash
terraform destroy
```

## File Structure

- `main.tf` - Container resource definitions
- `variables.tf` - Variable declarations
- `terraform.tfvars.example` - Example configuration template (commit to repo)
- `terraform.auto.tfvars` - Actual configuration with secrets (automatically loaded, excluded from git)
- `.gitignore` - Prevents secrets from being committed

## Customization

You can modify the following in `terraform.auto.tfvars`:

- **Resources**: `cores`, `memory`, `swap`, `rootfs_size`
- **Networking**: `ct_core_ip`, `ct_github_ip`, `bridge`, `nameserver`
- **Storage**: `storage` location (e.g., local-lvm)
- **Container IDs**: `ct_core_vmid`, `ct_github_vmid`

## Notes

- Containers are configured to run in unprivileged mode for security
- Nesting, keyctl, and fuse features are enabled for flexibility
- Both containers start automatically on Proxmox boot (onboot=true)
- Adjust the `pm_tls_insecure` setting for production environments

## Troubleshooting

### Error: "hostname lookup 'pve' failed"

This error means the `target_node` value doesn't match your Proxmox node name. To fix:

1. Find your Proxmox node name:
   - Log in to Proxmox Web UI
   - Go to Datacenter → Nodes
   - Note the exact node name (e.g., `proxmox1`, `pve-node1`, etc.)
   - Or check via SSH: `hostname`

2. Update `terraform.auto.tfvars`:

   ```terraform
   target_node = "your-actual-node-name"
   ```

3. Retry the plan and apply:

   ```bash
   terraform plan
   terraform apply
   ```

### Error: "401 Authentication failed"

Check that your `pm_api_token_id` and `pm_api_token` are correct and properly formatted:

- Token ID format: `user@realm!tokenname` (e.g., `root@pam!terraform`)
- Ensure the token has appropriate permissions for creating LXC containers
