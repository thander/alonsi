@alonsi.factory 'Tracks', ["Restangular", "$stateParams", "$rootScope", "$http",  (Restangular, $stateParams, $rootScope, $http) ->
  tracks =
    getTopCharts: ->
      Restangular.all("tracks").get("topcharts")
    getTrack: (track) ->

      token = $rootScope.currentUser.token
      url = "https://api.vk.com/method/audio.search?access_token=#{token}&callback=JSON_CALLBACK&count=20&q=#{track.track.artist.name}%20-%20#{track.track.name}"

      $http.jsonp(url).then (data) ->
        data = data.data
        loadedTracks = []
        _.each data.response, (item, index) ->
          if index > 0
            if (parseInt(item.duration) >= parseInt(track.track.duration)-3)&&(parseInt(item.duration) <= parseInt(track.track.duration)+3)
              loadedTracks.push(item)
        if loadedTracks.length is 0
          loadedTracks[0] = data.response[1]
        return {url: loadedTracks[0].url, duration: loadedTracks[0].duration}

    addToPlaylist: (track)->
      Restangular.all("playlists").all("add").post(track)

    getMainPlaylist: ->
      Restangular.all("playlists").getList()



  return tracks
]
