#Modules
Import-Module "C:\Program Files\Microsoft Dynamics 365 Business Central\200\Service\NavAdminTool.ps1" |Out-Null
."C:\src\OTS-BC\scripts\common_functions.ps1"

# Variables
#####

$server_instance = "svaya"
$port_prefix = "77"

$management_services_port = $port_prefix+"45"
$client_services_port = $port_prefix+"46"
$soap_services_port = $port_prefix+"47"
$odata_services_port = $port_prefix+"48"
$development_services_port = $port_prefix+"49"



$sql_server     = ""
$application_db = "BC-OTS-DEV-APP-D01"
$tenant_db      = "BC-OTS-DEV-D01"           
$tenant_name    = "svaya"

$user = "stroy-svaya-vm\hrs"

$build_artifact_folder = "C:\tmp\Apps\"
$groups_to_publish = "Base" + "," + "DEV"
$app_config_path = Join-Path $build_artifact_folder "AppConfig.json"
$settings_path = "C:\src\OTS-BC\settings.json"
$sync_mode = "ForceSync"
$exclusiveAccess = $false


#Add server instance
New-NAVServerInstance -ManagementServicesPort $management_services_port `
    -ServerInstance $server_instance `
    -ClientServicesCredentialType Windows `
    -ClientServicesPort $client_services_port `
    -DatabaseName $application_db `
    -DeveloperServicesPort $development_services_port `
    -ODataServicesPort $odata_services_port `
    -ServiceAccount NetworkService
#Restart-NAVServerInstance -ServerInstance $server_instance
Start-NAVServerInstance -ServerInstance $server_instance


#Add Web service instance
New-NAVWebServerInstance -Server localhost `
    -ServerInstance $server_instance `
    -WebServerInstance $server_instance `
    -AddFirewallException `
    -ClientServicesCredentialType Windows `
    -ClientServicesPort $client_services_port `
    -ManagementServicesPort $management_services_port `
    -SiteDeploymentType SubSite


#Add tenant
#####
Get-NAVTenant -ServerInstance $server_instance
Set-NAVServerConfiguration -ServerInstance $server_instance -KeyName DatabaseName -KeyValue $application_db
Set-NAVServerConfiguration -ServerInstance $server_instance -KeyName Multitenant -KeyValue $true
Restart-NAVServerInstance -ServerInstance $server_instance
Mount-NAVTenant -ServerInstance $server_instance -Tenant $tenant_name -DatabaseServer $sql_server -DatabaseName $tenant_db -EnvironmentType Production -AllowAppDatabaseWrite -OverwriteTenantIdInDatabase 
Get-NAVTenant -ServerInstance $server_instance |Format-Table Id, DatabaseName, State


# Add User
#####
New-NAVServerUser $server_instance -Tenant $tenant_name -WindowsAccount $user
New-NAVServerUserPermissionSet $server_instance -Tenant $tenant_name -WindowsAccount $user -PermissionSetId SUPER

Get-NAVAppInfo -ServerInstance $server_instance -Tenant $tenant_name


# Publishing artefacts
#####

#$tempAppsFolder = "\\Vm-itebs-buildt\BC\TempEnvApps\Dev\SK"

Deploy-ToTenantEnvironment `
    -server_instance $server_instance `
    -build_artifact_folder $build_artifact_folder `
    -settingsPath $settings_path `
    -appConfigPath $app_config_path `
    -tenant $tenant_name `
    -groupsToPublish $groups_to_publish `
    -tempAppsFolder $tempAppsFolder `
    -sync_mode $sync_mode `
    -exclusiveAccess $exclusiveAccess

