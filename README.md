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
```
## Deployment Instructions 🚀
Follow these steps to deploy the Azure infrastructure using Terraform:

```
## 1. Clone the Repository
If this configuration is stored separately, clone it first:

```bash
git clone <your-repo-url>
cd <your-repo-name>
```
## 2. Initialize Terraform
Initialize the Terraform working directory:

```bash
terraform init
```
## 3. Select Workspace (Optional)
To create and select a specific workspace (e.g., dev environment):

```bash
terraform workspace new dev
terraform workspace select dev
```
## 4. Plan the Deployment
Review the changes Terraform will make:

```bash
terraform plan
```
## 5. Apply the Deployment
Apply the Terraform configuration to deploy the infrastructure:

```bash
terraform apply
```
## 6. Destroy Resources (when needed)
To tear down and clean up all resources created by Terraform:
```bash
terraform destroy