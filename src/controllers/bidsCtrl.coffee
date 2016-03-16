'use strict'

module.exports = ($scope, formFabric) ->
  # Get data from localStorage
  $scope.bidsList = JSON.parse(formFabric.getBids())

  # Listener for throw bids to bidsCtrl
  $scope.$on 'addBid', () ->
    $scope.bidsList = formFabric.bidsList
    return

  # Clear filter history
  $scope.clear = () ->
    if $scope.search.project.length == 0
      delete $scope.search.project
      return




