@Sign = ["$scope", "$state", "Auth", "$rootScope", ($scope, $state, Auth, $rootScope) ->
  $scope.logintext = "Login with VKontakte"

  $scope.login =
    try: ->
      $scope.logintext = "Waiting..."
    success: ->
      $scope.logintext = "You are signed in. Please wait.."
      $state.go("main")

  Auth.login().then (user) ->
    $rootScope.currentUser = user
    $state.go "main.topcharts"

]
