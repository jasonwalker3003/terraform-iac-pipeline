# terraform-iac-pipeline

Azure infrastructure deployed only through a pipeline: a VNet, an NSG and a Linux VM that configures itself with cloud-init, in reusable Terraform modules. Lab work from week 6 of my Azure and DevOps training.

## How a change reaches Azure
1. A pull request runs terraform fmt, validate and plan, plus tflint and a Checkov scan. All are required checks on main.
2. Merging starts the apply workflow, which waits for approval in the production environment.
3. After approval it plans again and applies.
4. A manual workflow, also behind approval, destroys everything.

## Security
- The pipeline signs in to Azure with OIDC: no stored password. Entra trusts only pull requests and the production environment of this repo.
- Its identity is Contributor on one resource group, with blob access to one state container.
- State is in Azure Storage with shared keys off and Entra ID sign-in, with locking.
- My IP and subscription ID are GitHub secrets, masked in the public logs.

## Layout
- modules/network: VNet, subnet and NSG.
- modules/vm: public IP, NIC, Linux VM with cloud-init and auto-shutdown.
- moved.tf: how the code was refactored into modules without rebuilding anything.

## What I learned
- 
- 
- 
