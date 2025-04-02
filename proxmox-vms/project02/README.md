# OpenShift Multi node

pveum user add terraform-user@pve --password YOUR_SECURE_PASSWORD
pveum aclmod / -user terraform-user@pve -role Administrator

pveum user token add terraform-user@pve terraform-token --privsep 0
pveum user token list terraform-user@pve

