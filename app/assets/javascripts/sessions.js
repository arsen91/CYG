$(document).ready(function() {
    $('#logout').on("ajax:success", handler);

    function handler() {
      $('.menu').html($('<li><a href="/users/sign_in" class="button">Login</></>'))
    }
})