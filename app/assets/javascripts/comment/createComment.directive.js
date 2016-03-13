$(document).ready(function() {
    angular.module('CYG').directive('createComment', function() {
        return {
            restrict: 'C',
            link: function(scope, element) {
                element.find('form').on('ajax:success', function(event, data) {
                    var template = _.template(JST["templates/comment"]);
                    var newComment = template(data);
                    
                    $(newComment).prependTo('.comments');
                    $('.comments').find('.comment').first().find('.show-score').raty({
                        score: parseFloat($('.comments').find('.comment').first().find('.show-score').data('score')),
                        path: '/assets',
                        readOnly: true
                    });

                    element.find('textarea').val('');
                });
            }
        };
    });
});