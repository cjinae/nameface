# app = angular.module 'app', []
# app.filter 'escape', () ->
#   return window.escape

# angular.module('filters', []).filter 'escape', () ->
  # return (s) -> console.log("what the hell")
  #return window.escape

# angular.module('nameFace', ['filters'])

@SearchController = ($scope) ->
	$scope.events = events

# @ is coffeeScript for window.