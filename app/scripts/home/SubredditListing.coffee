angular.module("demoApp").factory("subredditListing", ["$http", "$q", "$filter", ($http, $q, $filter) ->

	domainFilter = $filter("domainFilter")

	subredditListing =
		getSubreddit: (subredditName, after) ->
			deferred = $q.defer()

			options =
				params:
					after: after

			$http.jsonp("https://reddit.com/r/#{subredditName}.json?jsonp=JSON_CALLBACK", options).then(
				(response) =>
					return response.data.data.children
			).then(
				(posts) ->
					return domainFilter(posts, "self.")
			).then(
				(posts) ->
					deferred.resolve(posts)
			).catch(
				(error) ->
					deferred.reject(error)
			)

			return deferred.promise

	return subredditListing
])