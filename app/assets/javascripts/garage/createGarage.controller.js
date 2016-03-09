$(document).ready(function() {
    angular.module('CYG').controller('CreateGarageController', ['mapFactory', '$element', "$scope", function(mapFactory, $element, $scope) {
    
        var days = [], 
            garageMarker,
            existingGarages = $element.find('div.temp_information').data('garages'),
            exist = false;

        $element.on('click', function(e) {
            if ($(e.target).hasClass('week-day')) {
                $(e.target).toggleClass('chosen');
                if ($(e.target).hasClass('chosen')) {
                    days.push(e.target.innerHTML);
                    $('.week-days:hidden').val(days.join(' '));
                }
            }
        });

        $element.find('#garage_address').on('blur', function(event) {
            if (!_.isEmpty(event.target.value)) {
                mapFactory.geocoder.geocode({
                    address: event.target.value, 
                    componentRestrictions: {
                        country: 'BY',
                        locality: 'Minsk'
                    }
                }, function(results, status) {
                    var address = results[0],
                    lat = address.geometry.location.lat(),
                    lng = address.geometry.location.lng();

                    var data = {
                        latitude: lat, 
                        longitude: lng,
                        popup: false,
                        showPopup: true, 
                        defaultText: "Проверьте правильность расположения маркера"
                    };
                    if (!garageMarker) {
                        garageMarker = mapFactory.addMarker(data, {draggable: true});
                    } else {
                        garageMarker.setLatLng([lat, lng]);
                    }
                    angular.element('.lat').val(lat);
                    angular.element('.lng').val(lng);

                    garageMarker.on('dragend', function(event) {
                        angular.element('.lat').val(event.target._latlng.lat);
                        angular.element('.lng').val(event.target._latlng.lng);
                    });
                });
            }
        });
    }]);
});