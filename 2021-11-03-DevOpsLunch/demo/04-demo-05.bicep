param name string = 'jpo2810'
param tags object = resourceGroup().tags
param sku string = 'B1'
param kind string = 'linux'
param sites array = [
  'jpo111'
  'jpo222'
]

var apsName = 'aps-${name}'

module aps 'modules/aps.bicep' = {
  name: 'aps-deployment'
  params: {
    apsName: apsName
    kind: kind
    sku: sku
    tags: tags
  }
}

module website 'modules/site.bicep' = {
  name: 'websites-deployment'
  params: {
    apsId: aps.outputs.apsId
    dockerImage: 'nginxdemos/hello'
    dockerImageTag: 'latest'
    sites: sites
    tags: tags
  }
}
