'use strict'

module.exports = ($scope, formFabric) ->
  # Get data from localStorage
  $scope.bidsList = JSON.parse(formFabric.getBids())

  # Listener for throw bids to bidsCtrl
  $scope.$on 'addBid', () ->
    $scope.bidsList = formFabric.bidsList
    return


