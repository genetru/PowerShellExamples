#FILE: EnumSites.ps1
#SUMMARY: This script is used to look up the site collections for each Migration DB in each Farm.
#Written by: Gene Trujillo

# List of parameters
Param (
[string] $WebAppUrl = $(throw "missing required parameter -WebAppUrl")
) 

#create folder on desktop
$server = dir "Env:COMPUTERNAME"
$folder = $server.value
New-Item $env:USERPROFILE\Desktop\$folder -ItemType Directory

# Declare variables
$MigrationDBs = @(
"content_m_1",
"content_m_2",
"content_m_3",
"content_m_4",
"content_m_5",
"content_m_6",
"content_m_7",
"content_m_8",
"content_m_9"
)

$stsadm = "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\12\BIN\stsadm.exe"

# Invoke stsadm to enumerate the site collections in each db in each farm in the specified datacenter.
Write-Host "Enumerating $WebAppUrl" -ForegroundColor Green -BackgroundColor black
ForEach ($MigrationDB in $migrationDBs)
{
Write-Host "Migration Content DB $migrationdb" -ForegroundColor Green -BackgroundColor black
. $stsadm -o enumsites -url $WebAppUrl -databasename $MigrationDB | out-file -append "$env:USERPROFILE\Desktop\$folder\sitecollections.csv"
}
