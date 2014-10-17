angular.module("demoApp").filter("domainFilter", [() ->

	return (posts, text) ->

		return _.filter(posts, (post) ->
			return post.data.domain.indexOf(text) < 0
		)

])