angular.module("demoApp").factory("subredditListing", ["$q", "$filter", "$resource", ($q, $filter, $resource) ->

	domainFilter = $filter("domainFilter")


	subredditResource = $resource(	"https://reddit.com/r/:subredditName.json", 
							{ subredditName: "@subredditName", jsonp: "JSON_CALLBACK" }, 
							{loadSubreddit: {method: 'JSONP'}}
						)

	subredditListing =
		getSubreddit: (subredditName, after) ->
			deferred = $q.defer()

			options =
				params:
					after: after

			subredditResource.loadSubreddit({subredditName: subredditName}).$promise.then(
				(response) ->
					return response
			).then(
				(response) =>
					return response.data.children
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