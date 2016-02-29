$(document).ready(function() {
    angular.module('CYG').controller('MapController', ['mapFactory', function(mapFactory) {
        navigator.geolocation.getCurrentPosition(function(position) {
            mapFactory.initMap(position.coords.latitude, position.coords.longitude);
        });
    }]);
});