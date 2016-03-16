'use strict'
_ = require('lodash/util')

module.exports = () ->
  service = {}
  service.storageName = 'bids'

  # Save data in localStorage
  service.saveBid = ($scope) ->
    if typeof(Storage) != "undefined"
      bid =
        "id":      _.uniqueId()
        'title':   $scope.title
        'text':    $scope.text
        'project': $scope.project
        'urgency': $scope.urgency
        'date':    $scope.date

      # Get bids from localStorage
      storageBids = JSON.parse( service.getBids() )

      bids = service.pushAndStringify(storageBids, bid)

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

