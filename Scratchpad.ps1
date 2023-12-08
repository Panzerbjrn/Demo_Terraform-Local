$location = "westeurope"
$resource_group_name = "TF_BackEnd_RG"
$storage_account_name = "panzerstatefiles"
$container_name = "tfstatefiles"
$key = "Demo_Terraform-Local"
$client_id = "fdc30c66-3a57-4ed3-b0d9-0c13b3979d61"
$client_secret = "fKd8Q~qyB1NrIROaFfB43Wx9S5phDLQLUOB_Mbfn"
$subscription_id = "2779514c-c4b8-4f24-b872-46f39810b01c"
$tenant_id = "ebac74d0-5784-4678-81c8-ac675268e2b5"

az login --service-principal -u http://azure-cli-2016-08-05-14-31-15 -p VerySecret --tenant contoso.onmicrosoft.com

az login --service-principal -t $tenant_id -u $client_id -p $client_secret

az group create --location $location --name $resource_group_name
az storage account create --name $storage_account_name --resource-group $resource_group_name --kind StorageV2 --sku Standard_LRS --https-only true --allow-blob-public-access false
az storage container create -n $container_name --account-name $storage_account_name --fail-on-exist


$PSAdminKey = Get-Content "C:\Dropbox\GitHub\PanzerProjects\PowerShell.Snippets\Misc.Azure\_Keys\PowerShell.Admin.AES.key"
$PSAdminPWD = Get-Content "C:\Dropbox\GitHub\PanzerProjects\PowerShell.Snippets\Misc.Azure\_Keys\PowerShell.Admin.Password.txt" | ConvertTo-SecureString -Key $PSAdminKey
$PSAdminUSR = Get-Content "C:\Dropbox\GitHub\PanzerProjects\PowerShell.Snippets\Misc.Azure\_Keys\PowerShell.Admin.Username.txt"
$PSAdminCreds = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $PSAdminUSR, $PSAdminPWD
$TenantId = 'ebac74d0-5784-4678-81c8-ac675268e2b5'
$SubscriptionId = 'Panzerbjrn-Sub'
$AppName = "AzureSPAppForLogin"
Connect-AzAccount -ServicePrincipal -SubscriptionId $SubscriptionId -TenantId $TenantId -Credential $PSAdminCreds

Connect-AzAccount -ServicePrincipal -SubscriptionId $subscription_id -TenantId $tenant_id -Credential $PSAdminCreds -Verbose


$SecurePassword = ConvertTo-SecureString -String $client_secret -AsPlainText -Force
$TenantId = $tenant_id
$ApplicationId = $client_id
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $ApplicationId, $SecurePassword
Connect-AzAccount -ServicePrincipal -TenantId $TenantId -Credential $Credential

##########################################################
# PowerShell
$env:ARM_CLIENT_ID = $client_id
$env:ARM_CLIENT_SECRET = $client_secret
$env:ARM_TENANT_ID = $tenant_id
$env:ARM_SUBSCRIPTION_ID = $subscription_id
##########################################################
Get-AzResourceGroup | Select -ExpandProperty ResourceGroupName | Sort
     | Remove-AzResourceGroup -AsJob -Force -Verbose

"panzerbjrnnetrg","TerraformAZDO","TerraformAZDOCLIv1","TerraformAZDOv2","TerraformGHActionsDemo","tfclirg" | foreach { Remove-AzResourceGroup $_ -Verbose -AsJob -Force }