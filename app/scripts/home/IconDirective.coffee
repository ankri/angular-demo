angular.module("demoApp").directive("icon", [() ->
	return {
		restrict: "A"
		link: (scope, element, attrs) ->
			element.addClass("fa fa-#{attrs.icon}")
	}
])