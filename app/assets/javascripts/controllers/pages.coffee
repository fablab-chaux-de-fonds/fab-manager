'use strict'

Application.Controllers.controller "PagesController", ['$scope', '$interpolate', '$http', 'pagePromise', ($scope, $interpolate, $http, pagePromise)->

  $scope.page = pagePromise

  template = undefined
  data_context = undefined

  if pagePromise.page_template != null && pagePromise.page_data_context != null
    $http
      .get(pagePromise.page_template.attachment.url)
      .success(
        (response) ->
          template = response
          return
      )
      .then(
        () ->
          $http.get(pagePromise.page_data_context.attachment.url)
            .success(
              (response) ->
                data_context = response
                return
            )
            .then(
              () ->
                $scope.page.content = $interpolate(template)(data_context)
                return
            )
          return
      )


  return
]
