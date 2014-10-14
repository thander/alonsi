@alonsi.factory 'Tracks', ["Restangular", "$stateParams", (Restangular, $stateParams) ->
  tracks =
    getTopCharts: ->
      Restangular.all("tracks").get("topcharts")

  return tracks
]
