$(document).ready(function() {
    angular.module('CYG').directive('notes', function() {
        return {
            restrict: 'C',
            link: noteLink
        };

        function noteLink(scope, element) {
            element.find('form').on('ajax:success', function(event, data) {
                element.find('.notes-list ul').append('<li class="note-item">' + data.description + '</li>');
                element.find('textarea').val('');
            });
        }
    });
});