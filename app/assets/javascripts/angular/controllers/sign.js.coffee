@Sign = ["$scope", "$state", ($scope, $state) ->
  $scope.logintext = "Login with VKontakte"

  $scope.login =
    try: ->
      $scope.logintext = "Waiting..."
    success: ->
      $scope.logintext = "You are signed in. Please wait.."
      $state.go("main")


]
