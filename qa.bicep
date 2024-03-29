//targetScope='subscription'

param envName string
param location string
param webAppName string = 'eus${envName}webapp'
param sku string


//module Webapprg 'modules/rg.bicep' = {
//  name: 'rgroup'
//  params: {
//    location: location
//    envName: envName
//  }
//}

module Webapp 'modules/webappservice.bicep' = {
  name: 'WebappModule'
  params: {
    location: location
    sku: sku
    webAppName: webAppName
  }
}

module Funapp 'modules/funapp.bicep' = {
  name: 'FunappModule'
  params: {
    appInsightsLocation: location
  }
}
