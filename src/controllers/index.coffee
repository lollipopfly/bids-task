'use strict'

app = require('angular').module('app')

app.controller('formCtrl',['$scope', '$filter', 'formFabric', require('./formCtrl')])
app.controller('bidsCtrl',['$scope', '$filter', 'formFabric', require('./bidsCtrl')])