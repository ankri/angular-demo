angular.module("demoApp").config(($stateProvider, $urlRouterProvider) ->
  # For any unmatched url, redirect to /state1
  $urlRouterProvider.otherwise("/")

  # Now set up the states
  $stateProvider.state('home', {
    url: "/"
    views:
      "navigation":
        templateUrl: "scripts/navigation/navigation.template.html"
        controller: "NavigationCtrl"
        controllerAs: "navigation"
      "content":
        templateUrl: "scripts/home/home.template.html"
        controller: "HomeCtrl"
        controllerAs: "home"
  })

  $stateProvider.state('about', {
    url: "/about"
    views:
      "navigation":
        templateUrl: "scripts/navigation/navigation.template.html"
        controller: "NavigationCtrl"
        controllerAs: "navigation"
      "content":
        templateUrl: "scripts/about/about.template.html"
  })

)