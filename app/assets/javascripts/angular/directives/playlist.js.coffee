@alonsi.directive "play", ["Tracks", "$rootScope", "$timeout", "$compile", (Tracks, $rootScope, $timeout, $compile) ->
  restrict: "E"
  replace: true
  scope: {playlist: '=list'}
  templateUrl:  'directives/playlist.html'
  link: (scope, element, attrs) ->

    scope.playthis = (track) ->
      scope.$parent.Player.play(track)

    scope.add = (track) ->
      Tracks.addToPlaylist(track).then (data) ->
        c data


]
