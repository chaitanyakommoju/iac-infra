# iac-infra

# 🚀 Azure Infrastructure Deployment with Terraform Modules

This project uses reusable Terraform modules to provision Azure resources, following a **modular**, **environment-specific**, and **scalable** structure.

---

## 📦 Modules Used

| Module | Repository |
|:------|:------------|
| Resource Group | [iac-az-rg-module](https://github.com/chaitanyakommoju/iac-az-rg-module.git) |
| Virtual Network | [iac-az-vnet-module](https://github.com/chaitanyakommoju/iac-az-vnet-module.git) |
| Network Interface Card (NIC) | [iac-az-nic-module](https://github.com/chaitanyakommoju/iac-az-nic-module.git) |
| Key Vault | [iac-az-keyvault-module](https://github.com/chaitanyakommoju/iac-az-keyvault-module.git) |
| Storage Account (Blob) | [iac-az-storage-module](https://github.com/chaitanyakommoju/iac-az-storage-module.git) |
| Virtual Machine (VM) | [iac-az-vm-module](https://github.com/chaitanyakommoju/iac-az-vm-module.git) |

---

## 🛠 Resource Flow

1. **Resource Group**
2. **Virtual Network** and **Subnets**
3. **NIC**
4. **Key Vault**
5. **Storage Account**
6. **Virtual Machine**

---

## 📋 Prerequisites

- Terraform v1.5+  
- Azure CLI installed and logged in  
- A Service Principal (SP) with necessary permissions  

Set the following environment variables before running Terraform:

```bash
export ARM_CLIENT_ID="your-client-id"
export ARM_CLIENT_SECRET="your-client-secret"
export ARM_SUBSCRIPTION_ID="your-subscription-id"
export ARM_TENANT_ID="your-tenant-id"

export TF_VAR_GITHUB_TOKEN="your-github-token"
export TF_VAR_GITHUB_OWNER="your-github-owner-name"

