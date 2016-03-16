'use strict'

module.exports = ($scope, formFabric) ->
  $scope.saveBid = ($event) ->
    $event.preventDefault()
    formFabric.saveBid($scope)

    return true

