var yogurtApp = angular.module('yogurt-app', ['ngResource']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

yogurtApp.factory('Yogurt', ['$resource', function($resource) {
  return $resource('/yogurts/:id',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);

yogurtApp.controller('YogurtCtrl', ['Yogurt', '$scope', function(Yogurt, $scope) {
    $scope.yogurts= [];

  Yogurt.query(function(yogurts) {
    $scope.yogurts = yogurts;
  });

}])