'use strict'

module.exports = () ->
  service = {}
  service.storageName = 'bids'

  # Delete bid
  service.delBid = (id, storageBids) ->
    bids = storageBids.filter((item) ->
      return id != item.id
    )

    # update bids localStorage
    service.updateBids(bids)
    return bids

  # Update Bids localStorage
  service.updateBids = (bids) ->
    if typeof(Storage) != "undefined"
      bids = JSON.stringify(bids)
      localStorage.setItem(service.storageName, bids)
  return service

