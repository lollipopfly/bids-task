'use strict'

app = require('angular').module('app')

app.controller('formCtrl',['$scope', 'formFabric', require('./formCtrl')])
app.controller('bidsCtrl',['$scope', 'formFabric', require('./bidsCtrl')])