'use strict';

Application.Services.factory('Version', ['$resource', function ($resource) {
  return $resource('/api/version/:origin',
    {}, {
      get: {
        method: 'POST'
      }
    });
}]);
