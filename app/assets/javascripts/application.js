// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require js.cookie

//= require jquery
//= require bootstrap-sprockets
//= require handlebars
//= require_tree .





/**
 * This is an example of a basic node.js script that performs
 * the Authorization Code oAuth2 flow to authenticate against
 * the Spotify Accounts.
 *
 * For more information, read
 * https://developer.spotify.com/web-api/authorization-guide/#authorization_code_flow
 */

$(function () {
    $(".effect div").css("opacity", "0");
    $(window).scroll(function () {
        $(".effect").each(function () {
            var imgPos = $(this).offset().top;
            var scroll = $(window).scrollTop();
            var windowHeight = $(window).height();
            if (scroll > imgPos - windowHeight + windowHeight / 5) {
                $("div", this).css("opacity", "1");
            } else {
                $("div", this).css("opacity", "0");
            }
        });
    });
});



function changeColorByAriaExpanded() {
    if (($("#hamburger").attr("aria-expanded") === "true")) {
        $("#header").css({
            opacity: "0.8"
        });
    }
    else {
        console.log($("#header"));
        $("#header").css({
            opacity: "1"
        });
    }

}

$(function () {
    $('.custom-file-input').on('change', function () {
        $(this).next('.custom-file-label').html($(this)[0].files[0].name);
    });
});


