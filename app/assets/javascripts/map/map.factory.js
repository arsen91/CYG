$(document).ready(function() {
    angular.module('CYG').factory('mapFactory', function() {
        var map;

        return {
            initMap: initMap,
            addMarker: addMarker
        };

        function initMap(lat, lon) {
            map = L.map('map').setView([lat, lon], 15);

            var googleLayer = new L.Google("ROADMAP");
            map.addLayer(googleLayer);
            this.addMarker({latitude: lat, longitude: lon, init: true});
        }

        function addMarker(garageConfig) {
            var popupElement;
            var marker = L.marker([garageConfig.latitude, garageConfig.longitude]).addTo(map);
            if (garageConfig.init) {
                popupElement = 'Вы здесь!'
            } else {
                var template = _.template(JST["templates/popupContent"]);
                popupElement = template(garageConfig);
            }
            marker.bindPopup(popupElement).openPopup();
        }
    });
});