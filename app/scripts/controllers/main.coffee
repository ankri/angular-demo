'use strict'

###*
 # @ngdoc function
 # @name demoAppApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the demoAppApp
###
angular.module('demoApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
