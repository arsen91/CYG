$(document).ready(function() {
    angular.module('CYG').directive('notes', function() {
        return {
            restrict: 'C',
            link: noteLink
        };

        function noteLink(scope, element) {
            element.find('form').on('ajax:success', function(event, data) {
                var noteItem = element.find('.note-item').first().clone();
                noteItem.find('.note-description').text(data.note.description);
                noteItem.find('.note-category').text(data.categoryName);
                element.find('.notes-list ul').append(noteItem);
                element.find('textarea').val('');
            });
        }
    });
});