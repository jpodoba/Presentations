param location string = resourceGroup().location
param name string = 'jpo2810'
param tags object = resourceGroup().tags
param sku string = 'B1'
param kind string = 'linux'

var apsName = 'aps-${name}'

resource aps 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: apsName
  location: location
  tags: tags
  sku: {
    name: sku
  }
  kind: kind
  properties: {
    reserved: true
  }
}
