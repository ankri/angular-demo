angular.module("demoApp").controller("NavigationCtrl", ["$scope", "$state", ($scope, $state) ->

	this.view = $state.current.name

	return this
])