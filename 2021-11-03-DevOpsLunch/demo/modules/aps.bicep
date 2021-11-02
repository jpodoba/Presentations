param location string = resourceGroup().location
param tags object
param apsName string
param sku string
param kind string

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

output apsId string = aps.id
