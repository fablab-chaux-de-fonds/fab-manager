'use strict'

Application.Controllers.controller "HomeController", ['$scope', '$http', '$stateParams', 'Twitter', 'lastMembersPromise', 'lastProjectsPromise', 'upcomingEventsPromise', 'homeBlogpostPromise', 'twitterNamePromise', 'pagePromise', ($scope, $http, $stateParams, Twitter, lastMembersPromise, lastProjectsPromise, upcomingEventsPromise, homeBlogpostPromise, twitterNamePromise, pagePromise)->

  ### PUBLIC SCOPE ###

  ## The last registered members who confirmed their addresses
  $scope.lastMembers = lastMembersPromise

  ## The last tweets from the Fablab official twitter account
  $scope.lastTweets = []

  ## The last projects published/documented on the plateform
  $scope.lastProjects = lastProjectsPromise

  ## The closest upcoming events
  $scope.upcomingEvents = upcomingEventsPromise

  ## The admin blogpost
  $scope.homeBlogpost = homeBlogpostPromise.setting.value

  ## Twitter username
  $scope.twitterName = twitterNamePromise.setting.value

  ##
  # Test if the provided event run on a single day or not
  # @param event {Object} single event from the $scope.upcomingEvents array
  # @returns {boolean} false if the event runs on more that 1 day
  ##
  $scope.isOneDayEvent = (event) ->
    moment(event.start_date).isSame(event.end_date, 'day')

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

  ### PRIVATE SCOPE ###

  ##
  # Kind of constructor: these actions will be realized first when the controller is loaded
  ##
  initialize = ->
    # we retrieve tweets from here instead of ui-router's promise because, if adblock stop the API request,
    # this prevent the whole home page to be blocked
    $scope.lastTweets =  Twitter.query(limit: 1)

    # if we recieve a token to reset the password as GET parameter, trigger the
    # changePassword modal from the parent controller
    if $stateParams.reset_password_token
      $scope.$parent.editPassword($stateParams.reset_password_token)
    if $stateParams.signup
      $scope.$parent.signup()

  ## !!! MUST BE CALLED AT THE END of the controller
  initialize()
]
