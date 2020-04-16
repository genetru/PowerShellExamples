$identity = "SharePoint";
$searchapp = Get-SPEnterpriseSearchServiceApplication "Search Service Application"
if ($searchapp -eq $null) { $searchapplication = Read-Host "What is the name of the Search Application?"; $searchapp = Get-SPEnterpriseSearchMetadataManagedProperty -SearchApplication $searchapplication  }
$cat = Get-SPEnterpriseSearchMetadataCategory –Identity $identity -SearchApplication $searchapp
$cproperties = Get-SPEnterpriseSearchMetadataCrawledProperty -SearchApplication $searchapp -Category $cat 
$cproperties |  Export-Csv ".\customer_env_crawled_properties.csv"