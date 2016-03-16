'use strict'

module.exports = ($scope, formFabric) ->
  $scope.bidsList = JSON.parse(formFabric.getBids())


