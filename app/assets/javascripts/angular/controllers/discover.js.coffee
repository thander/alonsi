@Discover = ["$scope", "$rootScope", "Tracks", ($scope, $rootScope, Tracks) ->

  $rootScope.$on "devise:unauthorized", (event, xhr, deferred) ->
    document.location.href = '/'


]
