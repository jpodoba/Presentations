targetScope = 'subscription'

param location string = 'northeurope'
param name string = 'jpo2810new'
param tags object = {
  env: 'lab'
  project: 'bicep'
  customer: 'Jakub Podoba'
  projectRole: 'demo'
}
param sku string = 'B1'
param kind string = 'linux'
param sites array = [
  'jpo111new'
  'jpo111new'
]
param rgName string = 'lab-jpodoba-bicep02-rg'

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
