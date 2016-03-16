'use strict'

module.exports = ($scope, $filter, formFabric, bidsFabric) ->
  # Get data from localStorage
  $scope.bidsList = JSON.parse(formFabric.getBids())
  orderBy = $filter('orderBy')

  # Listener for throw bids to bidsCtrl
  $scope.$on 'addBid', () ->
    $scope.bidsList = formFabric.bidsList
    return

  # Delete bid
  $scope.delBid = (id) ->
    # get bids from localStorage
    storageBids = JSON.parse(formFabric.getBids())
    $scope.bidsList = bidsFabric.delBid(id, storageBids)
    return

  # Clear filter history
  $scope.clear = () ->
    if $scope.search.project.length == 0
      delete $scope.search.project
      return

  # Sort bids
  $scope.order = (predicate) ->
    $scope.predicate = predicate
    $scope.reverse = if ($scope.predicate == predicate) then !$scope.reverse else false
    $scope.bidsList = orderBy($scope.bidsList, predicate, $scope.reverse)
    return

  # Default sort
  $scope.order('title', true)




