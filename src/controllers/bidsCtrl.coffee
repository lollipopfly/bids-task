'use strict'

module.exports = ($scope, $filter, formFabric) ->
  # Get data from localStorage
  $scope.bidsList = JSON.parse(formFabric.getBids())
  orderBy = $filter('orderBy')

  # Listener for throw bids to bidsCtrl
  $scope.$on 'addBid', () ->
    $scope.bidsList = formFabric.bidsList
    return

  # Clear filter history
  $scope.clear = () ->
    if $scope.search.project.length == 0
      delete $scope.search.project
      return


  $scope.order = (predicate) ->
    $scope.predicate = predicate
    $scope.reverse = if ($scope.predicate == predicate) then !$scope.reverse else false
    $scope.bidsList = orderBy($scope.bidsList, predicate, $scope.reverse)
    return

  $scope.order('title', true)




