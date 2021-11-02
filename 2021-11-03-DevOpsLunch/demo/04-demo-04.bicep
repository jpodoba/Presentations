param location string = resourceGroup().location
param name string = 'jpo2810'
param tags object = resourceGroup().tags
param sku string = 'B1'
param kind string = 'linux'
param sites array = [
  'jpo111'
  'jpo222'
]

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

// resource site 'Microsoft.Web/sites@2021-02-01' = {
//   name: siteName
//   location: location
//   properties: {
//     serverFarmId: aps.id
//   }
// }

resource website 'Microsoft.Web/sites@2021-02-01' = [for site in sites: {
  name: 'web-${site}'
  location: location
  properties: {
    serverFarmId: aps.id
  }
}]

// output siteUri string = website.properties.defaultHostName

output siteUri array = [for (site, i) in sites: {
  uri: website[i].properties.defaultHostName
}]
