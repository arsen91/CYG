$(document).ready(function() {
    angular.module('CYG').directive('carControl', function() {
        return {
            restrict: 'C',
            link: linkFunction
        };

        function linkFunction(scope, element) {
            element.on('click', function() {
                var car_id = element.data('carid');
                $.ajax({
                    type: 'GET',
                    url: '/cars/' + car_id + '/journal',
                    dataType: "JSON",
                    success: function(data) {
                      location.pathname = 'journals/' + data.journal_id;
                    }
                });
            });
        }
    });
});