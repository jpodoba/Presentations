resource aps 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: 'aps-jpo2810'
  location: 'northeurope'
  sku: {
    name: 'B1'
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}
