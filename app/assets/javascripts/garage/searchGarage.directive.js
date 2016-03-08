$(document).ready(function() {
    angular.module('CYG').directive('searchGarage', ['mapFactory', function(mapFactory) {
        var markers = [];
        return {
            restrict: 'C',
            link: function(scope, element) {
                element.find('#garage-search').on('ajax:success', searchHandler);

                function searchHandler(event, data) {
                    _.forEach(markers, function(m) {
                        mapFactory.map.removeLayer(m);
                    });

                    _.forEach(data, function(item) {
                        item.popup = true;
                        markers.push(mapFactory.addMarker(item, {icon: mapFactory.carIcon}));
                    });
                }
            }
        };
    }]);
});