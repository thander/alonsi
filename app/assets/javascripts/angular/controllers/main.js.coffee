@Main = ["$scope", "$rootScope", "$state", "Tracks", "$sce", "$timeout", "Auth", ($scope, $rootScope, $state, Tracks, $sce, $timeout, Auth) ->

  Auth.login().then (user) ->
    $rootScope.currentUser = user

  $rootScope.$on "devise:unauthorized", (event, xhr, deferred) ->
    document.location.href = '/'

  if $state.current.name is 'main'
    $state.go "main.topcharts"

  $scope.playing = true
  $scope.cover = "/assets/rihana.jpg"
  $scope.timeline = 0
  down = false
  $scope.slider = {
    range: false
    step: 1
  }

  player = document.getElementById "player"

  $scope.Player =
    play: (track = false) ->
      $scope.playing = true
      if track
        $rootScope.currentTrack = track
        Tracks.getTrack(track).then (data) ->
          $scope.duration = parseInt(data.duration)
          $scope.src = $sce.trustAsResourceUrl(data.url)
          $scope.cover = if typeof track.track.image isnt 'undefined' then track.track.image[3].content
          $timeout ->
            player.play()
      else
        player.play()
    pause: ->
      $scope.playing = false
      player.pause()
    next: ->
      index = this.playlist.indexOf($rootScope.currentTrack)
      index += 1
      player.pause()
      this.play(this.playlist[index])
    prev: ->
      index = this.playlist.indexOf($rootScope.currentTrack)
      index -= 1
      player.pause()
      this.play(this.playlist[index])

    playlist: []



  player.addEventListener "ended", ->
    $scope.Player.next()
  player.addEventListener "timeupdate", ->
    angular.element(".timeline").slider("value", parseInt(player.currentTime, 10))

  angular.element(".timeline").bind "mousedown", ->
    down = true
    $scope.Player.pause()

  angular.element("body").bind "mouseup", ->
    if down
      player.currentTime = $scope.timeline
      $scope.Player.play()
      down = false





]

