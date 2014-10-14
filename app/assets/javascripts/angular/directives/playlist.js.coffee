@alonsi.directive "play", ->
  restrict: "E"
  replace: true
  scope: {playlist: '=list'}
  templateUrl:  'directives/playlist.html'
