/*global $*/

$(function() {
  $('.slider').slick({
    speed: 1000,
    
    prevArrow: '<button class="slide-arrow prev-arrow"></button>',
    nextArrow: '<button class="slide-arrow next-arrow"></button>'
  });
});

$('input').on('change', function () {
    var file = $(this).prop('files')[0];
    $('p').text(file.name);
});
