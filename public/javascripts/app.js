$(document).ready(function() {
  $('#main-nav > ul').hide();

  $('.below-nav').on('click', function(){
    $('#main-nav > ul').slideUp('fast');
    $('.below-nav').removeClass( "canvas-blur" )
  });

  $('#menu').on('click', function() {
    event.stopPropagation();
    $('.below-nav').toggleClass("canvas-blur" )
    $('#main-nav > ul').slideToggle('fast');
  });

});
