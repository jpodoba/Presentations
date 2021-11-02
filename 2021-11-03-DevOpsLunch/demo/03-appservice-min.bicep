@minLength(2)
param webAppName string = 'webApp-${uniqueString(resourceGroup().id)}'
param location string = resourceGroup().location
param sku string = 'B1'
param kind string = 'linux'

var appServicePlanPortalName_var = 'AppServicePlan-${webAppName}'

resource appServicePlanPortalName 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanPortalName_var
  location: location
  sku: {
    name: sku
  }
  kind: kind
  properties: {
    reserved: true
  }
}
