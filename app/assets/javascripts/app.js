var app = angular.module('nbaApp', ['ngRoute']);
app.config(function($routeProvider) {
    $routeProvider
        .when("/following", {
            templateUrl: "/partials/following.html",
            controller: "playersController"
        })
        .when("/new", {
            templateUrl: "/partials/new.html",
            controller: "teamsController"
        })
});

app.factory("playerFactory", function($http){
    var factory = {};
    factory.index = function(callback) {
        $http.get("/players").success(function(output){
            callback(output);
        })
    }
    return factory;
})
app.controller("playersController", function($scope, playerFactory){
    playerFactory.index(function(json){
        $scope.players = json;
    })
})


app.controller("playersController", function($scope){
    $scope.players = [
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
app.controller("teamsController", function($scope){
    $scope.teams = [
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