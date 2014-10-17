angular.module("demoApp").directive("redditPost", [() ->
	return {
		restrict: "E"
		templateUrl: "scripts/home/redditPost.template.html"
		scope: {
			post: "="
			index: "@"
		}
		link: (scope, element, attrs) ->
	}	
]) 