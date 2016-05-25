var app = angular.module('musicApp', ['ngRoute']);
app.config(function($routeProvider) {
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
});

app.factory("followsFactory", function($http){
    var factory = {};
    factory.index = function(callback) {
        $http.get("/players").success(function(output){
            callback(output);
        })
    }
    return factory;
})

app.factory("newReleasesFactory", function($http){
    var factory = {};
    factory.index = function(callback) {
        $http.get("/teams").success(function(output){
            callback(output);
        })
    }
    return factory;
})

app.factory("trendingFactory", function($http){
    var factory = {};
    factory.index = function(callback) {
        $http.get("/teams").success(function(output){
            callback(output);
        })
    }
    return factory;
})




app.controller("followsController", function($scope, followsFactory){

    followsFactory.index(function(json){
        $scope.follows = json;
    })

    $scope.follows = [
        {firstName: "Michael", lastName: "Jordan"},
        {firstName: "Kobe", lastName: "Bryant"},
        {firstName: "Kevin", lastName: "Garnett"},
        {firstName: "LeBron", lastName: "James"},
        {firstName: "Stephen", lastName: "Curry"},
        {firstName: "Jordan", lastName: "Clarkson"},
        {firstName: "Derek", lastName: "Fisher"},
        {firstName: "Jimmy", lastName: "Butler"}
    ]
})

app.controller("trendingController", function($scope, trendingFactory){

    trendingFactory.index(function(json){
        $scope.trends = json;
    })

    $scope.trends = [
        {firstName: "Michael", lastName: "Jordan"},
        {firstName: "Kobe", lastName: "Bryant"},
        {firstName: "Kevin", lastName: "Garnett"},
        {firstName: "LeBron", lastName: "James"},
        {firstName: "Stephen", lastName: "Curry"},
        {firstName: "Jordan", lastName: "Clarkson"},
        {firstName: "Derek", lastName: "Fisher"},
        {firstName: "Jimmy", lastName: "Butler"}
    ]
})

app.controller("newController", function($scope, newReleasesFactory){

   newReleasesFactory.index(function(json){
        $scope.newReleases = json;
    })

    $scope.newReleases = [
        {name: "Boston Celtics"},
        {name: "Brooklyn Nets"},
        {name: "New York Knicks"},
        {name: "Philadelphia 76ers"},
        {name: "Toronto Rapters"},
        {name: "Chicago Bulls"},
        {name: "Cleveland Cavaliers"},
        {name: "Detroit Pistons"},
        {name: "Indiana Pacers"},
        {name: "Milwaukee Bucks"},
        {name: "Atlanta Hawks"},
        {name: "Charlotte Hornets"},
        {name: "Miami Heat"},
        {name: "Orlando Magic"},
        {name: "Washington Wizards"},
        {name: "Denver Nuggets"},
        {name: "Minnesota Timberwolves"},
        {name: "Oklahoma City Thunder"},
        {name: "Portland Trail Blazers"},
        {name: "Utah Jazz"},
        {name: "Golden State Warriors"},
        {name: "Los Angeles Clippers"},
        {name: "Los Angeles Lakers"},
        {name: "Phoenix Suns"},
        {name: "Sacramento Kings"},
        {name: "Dallas Mavericks"},
        {name: "Houston Rockets"},
        {name: "Memphis Grizzlies"},
        {name: "New Orleans Pelicans"},
        {name: "San Antonio Spurs"}
    ]
})