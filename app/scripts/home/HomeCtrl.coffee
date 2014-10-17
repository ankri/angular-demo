angular.module("demoApp").controller("HomeCtrl", ["$scope", "subredditListing", ($scope, subredditListing) ->

	@posts = []
	self = this
	this.isLoading = true
	this.isLoadingMore = false

	loadMore = (subredditName, afterId) ->
		subredditListing.getSubreddit(subredditName, afterId).then(
			(posts) ->
				angular.forEach(posts, (post) ->
					self.posts.push(post)
				)
				self.isLoading = false
				self.isLoadingMore = false
			,
			(error) ->
				console.error(error)
				self.isLoading = false
				self.isLoadingMore = false
		)

	this.loadMorePosts = () ->
		self.isLoadingMore = true
		lastPost = self.posts[self.posts.length - 1]
		loadMore("angularJs", lastPost.kind + "_" + lastPost.data.id)


	loadMore("angularJs")

	return this
])