param location string = resourceGroup().location
param tags object
param sites array
param dockerImage string
param dockerImageTag string
param apsId string

resource website 'Microsoft.Web/sites@2021-02-01' = [for site in sites: {
  name: 'web-${site}'
  location: location
  tags: tags
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVER_URL'
          value: 'https://index.docker.io'
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_USERNAME'
          value: ''
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
          value: ''
        }
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: 'false'
        }
      ]
      linuxFxVersion: 'DOCKER|${dockerImage}:${dockerImageTag}'
    }
    serverFarmId: apsId
  }
}]

output siteUri array = [for (site, i) in sites: {
  uri: website[i].properties.defaultHostName
}]
