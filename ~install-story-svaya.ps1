#Modules
Import-Module "C:\Program Files\Microsoft Dynamics 365 Business Central\200\Service\NavAdminTool.ps1" |Out-Null
##."C:\src\OTS-BC\scripts\common_functions.ps1"

# Variables
#####

$server_instance = "svaya"
$webserver_instance = "svaya"
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
##Remove-NAVWebServerInstance -WebServerInstance $webserver_instance
New-NAVWebServerInstance -Server localhost `
    -ServerInstance $server_instance `
    -WebServerInstance $webserver_instance `
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

Restart-NAVServerInstance -ServerInstance $server_instance

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




## add new NavUserPassword user
$new_user = 'devuser1'
$pwd = ConvertTo-SecureString "P@$$W0rD!" -AsPlainText -Force

New-NAVServerUser -ServerInstance $server_instance -Tenant $tenant_name -UserName $new_user -Password $pwd
New-NAVServerUserPermissionSet -PermissionSetId SUPER -ServerInstance $server_instance -Tenant $tenant_name -UserName $new_user

##   NAVUSERPASSWORD
# https://www.sauravdhyani.com/2023/05/how-to-set-up-navuserpassword.html
##
#Set the ClientServicesCredentialType to NavUserPassword.
Set-NAVServerConfiguration -ServerInstance $server_instance -KeyName ClientServicesCredentialType -KeyValue NavUserPassword
Restart-NAVServerInstance -ServerInstance $server_instance

##Configure Business Central Web Server components
#edit C:\inetpub\wwwroot\svaya\navsettings.json

## To NavUserPassword ClientServicesCredentialType
Set-NAVServerConfiguration -ServerInstance $server_instance -KeyName ClientServicesCredentialType -KeyValue NavUserPassword
Restart-NAVServerInstance -ServerInstance $server_instance
Set-NAVWebServerInstanceConfiguration -WebServerInstance $webserver_instance -KeyName ClientServicesCredentialType -KeyValue NavUserPassword 

## To Windows ClientServicesCredentialType
$webserver_instance = "svaya"
Set-NAVServerConfiguration -ServerInstance $server_instance -KeyName ClientServicesCredentialType -KeyValue Windows
Restart-NAVServerInstance -ServerInstance $server_instance
Set-NAVWebServerInstanceConfiguration -WebServerInstance $webserver_instance -KeyName ClientServicesCredentialType -KeyValue Windows



## cert
##
# https://www.sauravdhyani.com/2023/05/how-do-i-configure-navuserpassword-with.html
##
$thumbprint = "d81349f5575aae1f26679fd2b25613ff97987e14"
$webserver_instance = "BC200"
$dns_name = "stroy-svaya-vm"
Set-NAVServerConfiguration -ServerInstance $server_instance -KeyName ServicesCertificateThumbprint -KeyValue $thumbprint

Set-NAVWebServerInstanceConfiguration -WebServerInstance $webserver_inctance -KeyName DnsIdentity -KeyValue $dns_name
Set-NAVWebServerInstanceConfiguration -WebServerInstance $webserver_inctance -KeyName RequireSsl -KeyValue true
Set-NAVWebServerInstanceConfiguration -WebServerInstance $webserver_inctance -KeyName ServerHttps -KeyValue true