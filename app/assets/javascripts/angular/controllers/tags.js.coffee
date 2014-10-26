@Tags = ["$scope", "$rootScope", "Tags", "$state", ($scope, $rootScope, Tags, $state) ->

  $rootScope.$on "devise:unauthorized", (event, xhr, deferred) ->
    document.location.href = '/'

  $scope.promise = Tags.getTopTags().then (data) ->
    $scope.tags = data

  $scope.getByTag = (tag) ->
    $state.go("main.tags.tracks", {tag: tag})

]


@TracksByTag = ["$scope", "$rootScope", "Tags", "$state", ($scope, $rootScope, Tags, $state) ->

  Tags.getTracks($state.params.tag).then (data) ->
    $scope.$parent.Player.playlist = data

]
