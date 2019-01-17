# testing_repo
# adf-pipeline

When you deploy this Azure Resource Manager template, a data factory of version 2 is created with the following entities:

# Azure Storage linked service, Azure SQL Database linked service, Azure Blob input datasets, Azure SQL Datbase output dataset, Pipeline with a copy activity

az group create -l eastus -n MyResourceGroup
az group deployment create --resource-group MyResourceGroup --verbose --template-uri "https://raw.githubusercontent.com/sangaml/testing_repo/master/adf-pipeline-copydata.json" `
--parameters dataFactoryName="adfsangamtest", dataFactoryLocation="East US", azureStorageConnectionString=sangae26e4d8f0c21dns, azureSqlDatabaseConnectionString="sangae26e4d8f0c21dns", `
azureSqllDataWarehouseConnectionString="sangae26e4d8f0c21dns"
