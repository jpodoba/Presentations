# Demo
All those commands are available for you in my GitHub repository. Url will be at the last slide.

# login and select subscription
```
az login
az account set --subscription <subscription-id>
```

# create a simple app service plan
- app service plan
- static values
- build JSON template
```
az bicep build --file ./04-demo-01.bicep
```

- create a resource group
```
az group create -l northeurope -n lab-jpodoba-bicep01-rg --tags env=lab project=bicep customer='Jakub Podoba' projectRole=demo
```

- deploy created bicep file
```
az deployment group create -g lab-jpodoba-bicep01-rg -f ./04-demo-01.bicep
```

# add parameters and variables
- replace static values by parameters
- add variables
- add a bicep function: resourceGroup().location, resourceGroup().tags
```
az deployment group create -g lab-jpodoba-bicep01-rg -f ./04-demo-02.bicep
```

- parameters declaration
  - allowed
  - min max
  - secure
```
az deployment group create -g lab-jpodoba-bicep01-rg -f ./04-demo-02a.bicep
```

# add website and use loops
- add website resource
- use auto depend
- output website URI
```
az deployment group create -g lab-jpodoba-bicep01-rg -f ./04-demo-03.bicep
```

- loops
```
az deployment group create -g lab-jpodoba-bicep01-rg -f ./04-demo-04.bicep
```

- add an extra website and show **what-if**
```
az deployment group what-if -g lab-jpodoba-bicep01-rg -f ./04-demo-04a.bicep
```

# modules
- extract modules
```
az deployment group create -g lab-jpodoba-bicep01-rg -f ./04-demo-05.bicep
```

# scopes and resource group
- add scope,
- add tags,
- create a resource group
- change deployment command
```
az deployment sub create --location northeurope -f ./04-demo-06.bicep
```

# external parameters
- extract parameters to separate file
```
az deployment sub create --location northeurope -f ./04-demo-07.bicep -p @dev.parameters.json
```

- overwrite parameters
```
az deployment sub create --location northeurope -f ./04-demo-07.bicep -p @dev.parameters.json -p name=jposoft
```