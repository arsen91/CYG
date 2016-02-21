$(document).ready(function() {
    angular.module('CYG').factory('mapFactory', function() {
        var map;
        return {
            initMap: function(lat, lon) {
                map = L.map('map').setView([lat, lon], 15);

                var googleLayer = new L.Google("ROADMAP");
                map.addLayer(googleLayer);
                this.addMarker(lat, lon);
            },

            addMarker: function(lat, lon) {
                L.marker([lat, lon]).addTo(map)
            }
        }
    });
});