@alonsi.factory 'Tags', ["Restangular", "$stateParams", "$rootScope", "$http",  (Restangular, $stateParams, $rootScope, $http) ->
  tags =
    getTopTags: ->
      Restangular.all("tags").getList()
    getTracks: (tag) ->
      Restangular.one("tags").all("tracks").getList({tag: tag })



  return tags
]
