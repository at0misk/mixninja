var app = angular.module('musicApp', ['ngRoute']);

$(document).on('ready page:load', function(){
    angular.bootstrap('body', ['musicApp']);
});

app.config(function($routeProvider, $httpProvider) {
    console.log("app configed");
    $routeProvider
        .when("/following", {
            templateUrl: "/partials/following.html",
            controller: "followsController"
        })
        .when("/new", {
            templateUrl: "/partials/new.html",
            controller: "newController"
        })
         .when("/top_rated", {
            templateUrl: "/partials/top_rated.html",
            controller: "trendingController"
        })

         $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');

});

app.factory("followsFactory", function($http){
    var factory = {};
    factory.index = function(callback) {
        $http.get("/dashboard/show").success(function(output){
            callback(output);
        })
    }
    return factory;
})

app.factory("newReleasesFactory", function($http){
    var factory = {};
    factory.index = function(callback) {
        $http.get("/new_tracks/show").success(function(output){
            callback(output);
        })
    }
    return factory;
})

app.factory("trendingFactory", function($http){
    var factory = {};
    factory.index = function(callback) {
        $http.get("/trending/show").success(function(output){
            callback(output);
        })
    }
    return factory;
})



app.controller("followsController", function($scope, followsFactory){

    followsFactory.index(function(json){
        $scope.follows = json;
    })
})

app.controller("trendingController", function($scope, trendingFactory){

    trendingFactory.index(function(json){
        $scope.trends = json;
    })
})

app.controller("newController", function($scope, newReleasesFactory){

   newReleasesFactory.index(function(json){
        $scope.newReleases = json;
    })

})