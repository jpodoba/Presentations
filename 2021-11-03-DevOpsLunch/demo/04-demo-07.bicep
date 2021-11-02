targetScope = 'subscription'

param location string
param name string
param tags object
param sku string
param kind string
param sites array
param rgName string

var apsName = 'aps-${name}'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
  tags: tags
}

module aps 'modules/aps.bicep' = {
  scope: resourceGroup(rg.name)
  name: 'aps-deployment'
  params: {
    apsName: apsName
    kind: kind
    sku: sku
    tags: tags
  }
}

module website 'modules/site.bicep' = {
  scope: resourceGroup(rg.name)
  name: 'websites-deployment'
  params: {
    apsId: aps.outputs.apsId
    dockerImage: 'nginxdemos/hello'
    dockerImageTag: 'latest'
    sites: sites
    tags: tags
  }
}
