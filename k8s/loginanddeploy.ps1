$Password = ConvertTo-SecureString "" -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential("", $Password)
Login-AzureRmAccount -ServicePrincipal -Credential $Cred -TenantId "" `
-Subscription ""

$ParametersObject = @{
 "adminUsername"="admin123"
 "adminPassword"="Password@123"
 "dnsNameforLBIP"="adminfdsfghjk"

}
$DeploymentID = Get-Random
New-AzureRmResourceGroupDeployment -ResourceGroupName k8s -TemplateFile "D:\Kubernetes\25Augest2019\create3node.json" `
-TemplateParameterObject $ParametersObject -Name $DeploymentID -Mode Incremental
