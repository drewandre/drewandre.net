// $(document).on('touchmove', function(e) {
//   e.preventDefault();
// });

// $('html, body').scrollTop(1);

$(document).ready(function() {
  $('#main-nav > ul').hide();
});

$('.below-nav').on('click', function(e){
  e.stopPropagation();
  $('#main-nav > ul').slideUp('fast');
  $('.below-nav').removeClass( "canvas-blur" )
});

$('#main-nav').on('mouseenter mouseleave', function(e) {
  e.stopPropagation();
  $('.below-nav').toggleClass("canvas-blur" )
  $('#main-nav > ul').slideToggle('fast');
});

// $('#main-nav').on('mouseenter', function(e) {
//   e.stopPropagation();
//   $('.below-nav').toggleClass("canvas-blur" )
//   $('#main-nav > ul').slideToggle('fast');
// });
// $('#main-nav').on('mouseleave', function(e) {
//   e.stopPropagation();
//   $('.below-nav').toggleClass("canvas-blur" )
//   $('#main-nav > ul').slideToggle('fast');
// });

$('#main-nav ul li').on('click', function(e) {
  e.stopPropagation();
  $('#main-nav ul li ul'[0]).slideDown('fast');
});

$('.work-image').each( function() {
  $(this).on('mouseenter', function(e) {
    e.stopPropagation();
    $(this).children("div").fadeIn('fast');
  });
  $(this).on('mouseleave', function(e) {
    e.stopPropagation();
    $(this).children("div").fadeOut('fast');
  });
});
