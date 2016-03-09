$(document).ready(function() {
    angular.module('CYG').factory('mapFactory', function() {

        return {
            initMap: initMap,
            addMarker: addMarker,
            geocoder: new google.maps.Geocoder(),
            carIcon: L.icon({
                iconUrl: 'assets/images/car-icon.png',
                iconSize: [32, 37]
            })
        };

        function initMap(lat, lon) {
            var markerConf = {
                latitude: lat, 
                longitude: lon, 
                popup: false, 
                defaultText: 'Вы здесь!', 
                showPopup: true
            },
            googleLayer = new L.Google("ROADMAP");

            this.map = L.map('map').setView([lat, lon], 10);
            this.map.addLayer(googleLayer);
            this.addMarker(markerConf);
        }

        function addMarker(garageConfig, options) {
            var popupElement, 
                popup,
                marker = L.marker([garageConfig.latitude, garageConfig.longitude], options || {}).addTo(this.map);

            if (garageConfig.popup) {
                var cost = '';
                var template = _.template(JST["templates/popupContent"]);
                popupElement = template(garageConfig);
                for (var i = 0; i < garageConfig.average_cost; i++) {
                    cost += '<span class="glyphicon glyphicon-usd"></span>';
                }
            } else {
                popupElement = garageConfig.defaultText;
            }
            
            popup = marker.bindPopup(popupElement)
            
            if (garageConfig.showPopup) {
                popup.openPopup();
            }
            return marker;
        }
    });
});