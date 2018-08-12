'use strict'

Application.Services.factory 'Page', ["$resource", ($resource)->
  $resource "/api/pages/:name",
    {name: "@name"}
    list:
      url: '/api/pages'
      isArray: true
]
