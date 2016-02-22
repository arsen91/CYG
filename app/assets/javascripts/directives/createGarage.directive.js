$(document).ready(function() {
    angular.module('CYG').directive('createGarageForm', ['mapFactory', function(mapFactory) {
        return {
            restrict: 'E',
            replace: true,
            template: '<div class="modal-content"></div>',

            link: function(scope, element) {
                element.on("ajax:success", function(event, data) {
                    mapFactory.addMarker(data.latitude, data.longitude);
                    angular.element('#garageModal').find('.close-button').click();
                });
            }
        };
    }]);
});