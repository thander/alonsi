@alonsi = angular.module('Alonsi', ['ui.router', 'ui.bootstrap', 'templates', 'Devise', 'restangular', 'ng-rails-csrf'])

@alonsi.config ["RestangularProvider", "$locationProvider", "$stateProvider", "$urlRouterProvider", "$provide", "AuthProvider", (RestangularProvider, $locationProvider, $stateProvider, $urlRouterProvider, $provide, AuthProvider) ->

  RestangularProvider.setRequestSuffix '.json'

  AuthProvider.loginPath('/users/sign_in.json');

  AuthProvider.logoutPath('/users/sign_out.json');

  # states

  $stateProvider
    .state('sign',
      url: ''
      templateUrl: 'signin.html'
      controller: 'Sign'
    )

    .state('main',
      url: '/main'
      templateUrl: 'main.html'
      controller: 'Main'
    )

    .state('main.topcharts',
      url: '/topcharts'
      templateUrl: 'topcharts/index.html'
      controller: 'Topcharts'
    )
    .state('main.discover',
      url: '/discover'
      templateUrl: 'discover/index.html'
      controller: 'Discover'
    )
    .state('main.tags',
      url: '/tags'
      templateUrl: 'tags/index.html'
      controller: 'Tags'
    )
    .state('main.myplaylists',
      url: '/myplaylists'
      templateUrl: 'myplaylists/index.html'
      controller: 'Myplaylists'
    )
    .state('main.liked',
      url: '/liked'
      templateUrl: 'liked/index.html'
      controller: 'Liked'
    )

]

@alonsi.run ["$rootScope", "$state", "$timeout", "$stateParams", "Auth", "$window", "$location", "Restangular", ($rootScope, $state, $timeout, $stateParams, Auth, $window, $location, Restangular) ->

  $rootScope.getCurrentUser = ->
    Auth.login().then (user) ->
      $rootScope.currentUser = user

  $rootScope.getCurrentUser()


]
