angular.module("demoApp").filter("timeAgo", [() ->

	return (timestamp) ->
		return moment.unix(timestamp).fromNow()

])