# Basic Understanding for terraform concepts

## Terraform commands
* `terraform init` - to initialize the current directorya nd fetch for *.tf files and download all necessary provider plugins
* `terraform plan` - to verify what all resources would be created before the apply commands
* `terraform plan -out=<filepath>` - to save the plan in an output file
* `terraform apply` - will execute the terraform scripts and create the required resources in the provider specified
* `terraform apply <savedterraformplanfile>` - to execute apply command from saved terraform plan configurations
* `terraform refresh` - to refresh the current state of the resources being created
* `terraform show` - to display the tfstate in the command line interface
* `terraform fmt` - to format the terraform file created
* `terraform validate` - to validate the terraform file
* `terraform taint <resourcename>` - to mark the specific terraform resource as tainted in the tfstate file
* `terraform graph > filename.dot` - to create a visual representation of the infrastructure that have to be created
    * Graphviz helps in creating a svg file for the representation
* `terraform workspace list` - to list all current workspaces
* `terraform workspace select <workspacename>` - to switch to the provided workspace
* `terraform workspace show` - provides the name of the current workspace being used
* `terraform workspace delete` - to delete a terraform workspace
* `terraform workspace new <workspacename>` - to create a new workspace and switch to the new workspace
* `terraform import <resourcename> <remoteresourceId>` - to import/link the tfstate of an existing resource to the new resource created
    * It would only generate the tfstate file currently, does not create the terraform file (future update from terraform)


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

# Splat Expression
* Helps output the attributes of all the resources created by the terraform file
* ex: aws_iam_user.lb[*].arn

# Provisioners
* Helps execute some scripts that are required to be executed at startup during resource creation
* Types of provisioners
    * local-exec : to execute scripts on local machine once the resource has been created
    * remote-exec : to execute scripts on remote machine created from the resource

# Terraform registry
Read about this

# Terraform Workspace
* Terraform workspace commands canb be found above
* For each workspace created, the tfstate of that workspace will be stored in a folder named `terraform.tfstate.d`
* There will a separate folder in each workspace in the above folder
* tfstate file for the default workspace will be created in the root directory itself

# Backends
* Used to store the tfstate of the file remotely unto a s3 bucket(for AWS only)
* State Locking feature is not avaialble by default in S3
* State Locking can be implemented on S3 by providing a dynamodb table with LockID as the primary key
* Commands : 
    * `terraform state list` - to list all the resources present in the state file
    * `terraform state mv <sourceresource> <destinationresource>` - to move the tfstate of a resource to another resource
    * `terraform state pull` - to pull the tfstate file from remote backend location
    * `terraform state push` - to push tfstate file to a remote backend location
    * `terraform state rm <resourcename>` - to remove the resource from the tfstate file
    * `terraform state show <resourcename>` - to show the tfstate of a particular resource
    * `terraform state force-unlock` - to forcefully unlock a resource

# Provider configurations
* Never store the accesskey and secret in terraform files
* Configure the AWS CLI with the required credentials to be used
* Provider block without any alias is considered as the default provider
* In case of multiple regions that need to be supported by the providers
    * use `alias` paramater in the providers configurations
    * use `provider` parameter in the resource configurations
* In case of multiple accounts that need to be supported by the providers
    * use `profile` paramater in the providers configurations to specify the profile that needs to be used from the AWS CLI
    * use `provider` parameter in the resource configurations
* To configure an AssumeRole to the terraform file, in the provider configurations provide the below configurations :
    assumeRole {
        role_arn = "<assumerole>"
        session_name = "session-name-provided-by-user" 
    }
* To avoid sensitive information to be displayed in output, use `sensitive` boolean flag to avoid it to be displayed in plain text

# Terraform workspaces
* Terraform Cloud provides a workspace where all runs associated with a particular terraform reporsitory will be recorded
* You can also specify the sentinel policies that need to be run when the terraform commands are being executed
* You can approve or discard a particular run
* You can configure the VCS to point to a specific github repository(version control)
* You can specify the Environment variables and terraform variables(as from terraform.tfvars) in the workspace console
* You can also view the cost estimates for the resources created by each run
* You can view the tfstate for each run
* Website : app.terraform.io
* Cost estimation feature is available in trial plan and higher
* Sentinal check is a paid feature. Its a policy as code feature integrated with Hashicorp terraform
* It is not available in the free plan, available in trial plan and higher
* Sentinal checks are applied after the plan step
