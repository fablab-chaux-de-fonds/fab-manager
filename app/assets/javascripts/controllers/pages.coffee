'use strict'

Application.Controllers.controller "PagesController", ['$scope', '$interpolate', '$http', 'pagePromise', ($scope, $interpolate, $http, pagePromise)->

  $scope.page = pagePromise

  ## Loading page template content
  if pagePromise.page_template != null
    $http.get(pagePromise.page_template.attachment.url)
      .success(
        (response) ->
          $scope.page.content = response
          return
      )

  ## Upgrade scope with page data context
  if pagePromise.page_data_context != null
    $http.get(pagePromise.page_data_context.attachment.url)
      .success(
        (response) ->
          Object.assign($scope, response)
          return
      )
]
