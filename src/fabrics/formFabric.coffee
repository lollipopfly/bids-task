'use strict'
_ = require('lodash/util')

module.exports = ($rootScope) ->
  service = {}
  service.storageName = 'bids'
  # Share data between controllers
  service.bidsList = []

  service.prepForBroadcast = (obj) ->
    this.bidsList = obj
    this.broadcastItem()
    return

  service.broadcastItem = () ->
    $rootScope.$broadcast('addBid')
    return

  # Save data in localStorage
  service.saveBid = ($scope, $filter) ->
    if typeof(Storage) != "undefined"
      bid =
        "id":      _.uniqueId()
        'title':   $scope.bid.title
        'text':    $scope.bid.text
        'project': $scope.bid.project
        'urgency': $scope.bid.urgency
        'date':    $filter('date')($scope.bid.date, "dd-MM-yyyy")

      # Get bids from localStorage
      storageBids = JSON.parse( service.getBids() )

      bids = service.pushAndStringify(storageBids, bid)
      # add bid to BidsCtrl
      service.prepForBroadcast(JSON.parse(bids))
      localStorage.setItem(service.storageName, bids)
    else
      console.log 'Sorry LocalStorage not working in this browser!'

  # Get data from localStorage
  service.getBids = () ->
    storageBids = localStorage.getItem(service.storageName)
    return storageBids

  # Push bid in Storage data bids and stringify object
  service.pushAndStringify = (storageBids, bid) ->
    storageBids = [] if !storageBids
    storageBids.push(bid)
    storageBids = JSON.stringify(storageBids)

    return storageBids

  return service

