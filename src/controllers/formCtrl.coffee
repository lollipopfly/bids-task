'use strict'

module.exports = ($scope, $filter, formFabric) ->
  $scope.saveBid = ($event) ->
    $event.preventDefault()
    formFabric.saveBid($scope, $filter)

    return true

