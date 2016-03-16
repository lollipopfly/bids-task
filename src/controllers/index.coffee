'use strict'

app = require('angular').module('app')

app.controller('formCtrl',['$scope', 'formFabric', require('./formCtrl')])