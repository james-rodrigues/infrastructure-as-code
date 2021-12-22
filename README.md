# terraform-codes

## Terraform commands
* terraform init - to initialize the current directorya nd fetch for *.tf files and download all necessary provider plugins
* terraform plan - to verify what all resources would be created before the apply commands
* terraform apply - will execute the terraform scripts and create the required resources in the provider specified
* terraform refresh - to refresh the current state of the resources being created
* terraform show - to display the tfstate in the command line interface

# Provider versioning
* Always specify the provider version to avoid incompatibility issues
* We can use >, <, >= , <=, ~>, <~ operators to specify the version of the provider plugins

# Third Party providers
* By Default all provider plugin are installed from the Hashicorp supported plugins
* Third party providers are not automatically installed by the terraform cli
* All third party providers need to be manually installed in the following directory :
    * Windows : %APPDATA%\terraform.d\plugins
    * Other systems : ~/.terraform.d/plugins