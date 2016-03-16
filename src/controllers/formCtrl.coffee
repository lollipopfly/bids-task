'use strict'

module.exports = ($scope, $filter, formFabric) ->
  # Save bid in localStorage
  $scope.saveBid = ($event, bid) ->
    $event.preventDefault()
    formFabric.saveBid($scope, $filter)
    # clear all text fields
    $scope.bid = ''

    return true

  # Listener for throw bids to bidsCtrl
  $scope.$on 'addBid', () ->
    $scope.bidsList = formFabric.bidsList
    return


