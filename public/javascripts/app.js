$(document).ready(function() {
  $('#main-nav > ul').hide();
});

$('.below-nav').on('click', function(e){
  e.stopPropagation();
  $('#main-nav > ul').slideUp('fast');
  $('.below-nav').removeClass( "canvas-blur" )
});

$('#menu').on('click', function(e) {
  e.stopPropagation();
  $('.below-nav').toggleClass("canvas-blur" )
  $('#main-nav > ul').slideToggle('fast');
});

$('#main-nav ul li').on('click', function(e) {
  e.stopPropagation();
  $('#main-nav ul li ul'[0]).slideDown('fast');
});
