@Myplaylists = ["$scope", "$rootScope", "Tracks", ($scope, $rootScope, Tracks) ->

  $rootScope.$on "devise:unauthorized", (event, xhr, deferred) ->
    document.location.href = '/'

  angular.element(document).ready ->
    $scope.promise = Tracks.getMainPlaylist().then (data) ->
      $scope.$parent.Player.playlist = data




]
