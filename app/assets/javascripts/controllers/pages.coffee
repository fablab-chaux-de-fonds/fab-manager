'use strict'

Application.Controllers.controller "PagesController", ['$scope', '$interpolate', 'pagePromise', ($scope, $interpolate, pagePromise)->

  ### PUBLIC SCOPE ###
  $scope.page = {};
  $scope.page.name = pagePromise.name;
  $scope.page.content = $interpolate(pagePromise.template)(pagePromise.data)
]
