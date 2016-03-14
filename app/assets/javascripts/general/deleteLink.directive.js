$(document).ready(function() {
    angular.module('CYG').directive('deleteLink', function() {
        return {
            restrict: 'C',
            link: function(scope, element) {

                element.find('#logout').on("ajax:success", handler);

                function handler() {
                  $('.menu').html($('<li><a href="/users/sign_in" class="button">Login</></>'))
                }
            }
        };
    });
});