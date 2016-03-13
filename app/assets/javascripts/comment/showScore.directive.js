$(document).ready(function() {
    angular.module('CYG').directive('showScore', function() {
        return {
            restrict: 'C',
            link: function(scope, element) {
                element.raty({
                    score: parseFloat(element.data('score')),
                    path: '/assets',
                    readOnly: true
                });
            }
        };
    });
});