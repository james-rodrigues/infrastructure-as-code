# Basic Understanding for terraform concepts

## Terraform commands
* `terraform init` - to initialize the current directorya nd fetch for *.tf files and download all necessary provider plugins
* `terraform plan` - to verify what all resources would be created before the apply commands
* `terraform apply` - will execute the terraform scripts and create the required resources in the provider specified
* `terraform refresh` - to refresh the current state of the resources being created
* `terraform show` - to display the tfstate in the command line interface
* `terraform fmt` - to format the terraform file created
* `terraform validate` - to validate the terraform file

# Provider versioning
* Always specify the provider version to avoid incompatibility issues
* We can use >, <, >= , <=, ~>, <~ operators to specify the version of the provider plugins

# Third Party providers
* By Default all provider plugin are installed from the Hashicorp supported plugins
* Third party providers are not automatically installed by the terraform cli
* All third party providers need to be manually installed in the following directory :
    * Windows : %APPDATA%\terraform.d\plugins
    * Other systems : ~/.terraform.d/plugins

# Variable Assignment Approaches
* Environment Variables
    * Windows : `setx TF_VAR_variablename value`
    * Others : `export TF_VAR_variablename="value"`
* From Custom file
    * `terraform <command> -var-file="filename.tfvars"`
* Variable Defaults
    * Specify in `terraform.tfvars` file
    * Follow same naming convention
* Command line 
    * terraform <command> -var="variablename=value"
* If required variable is not provided during execution of terraform command, terraform will ask for the input from the user before executing the command

# Variable Types
* To restrict to having valid input provided by the user
* Current types available : list, map, bool, string and number

# Count Parameter
* Count parameter can be used to create the same resource as many number of times as specified in the value of count
* ${count.index} variable can be used to get the iteration number of the count variable
* Count Index can be used along with terraform variables

# Conditional Parameters
* condition ? trueValue : falseValue

# Locals
* Helps specify local variables that can help common out repititive variables
* Can we used with Conditions and variables
* Local variables can be outputted using `local.variablename`

# Functions
* We can run the inbuilt functions using the command `terraform console`
* Paste inbuilt functions documentation here

# Datasource
* Data source can be used to dynamically fetch the values provided by AWS
* `data` tag is used to specify datasources
* useful to fetch ami's based on the region in which the terraform code is deployed

# Debugging
* TF_LOG - to specify the log level for the terraform logs
* TF_LOG_PATH - to specify the file path where the terraform logs needs to be saved

# Dynamic Block
* Helps remove repeated blocks of configurations
* `iterator` - gives an alias variable for each iteration, if not provided `blockname` provided after the dynamic keyord will be used