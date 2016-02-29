$(document).ready(function() {
    angular.module('CYG').directive('createGarageForm', ['mapFactory', function(mapFactory) {
        return {
            restrict: 'E',
            replace: true,
            template: '<div class="modal-content"></div>',

            link: function(scope, element) {
                var days = [];
                element.on('click', function(e) {
                    if ($(e.target).hasClass('week-day')) {
                        $(e.target).toggleClass('chosen');
                        if ($(e.target).hasClass('chosen')) {
                            days.push(e.target.innerHTML);
                            $('.week-days:hidden').val(days.join(' '));
                        }
                    }
                });

                element.on("ajax:success", function(event, data) {
                    days = [];
                    mapFactory.addMarker(data);
                    angular.element('#garageModal').find('.close-button').click();
                });
            }
        };
    }]);
});