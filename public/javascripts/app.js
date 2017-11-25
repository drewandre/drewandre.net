$(document).ready(function() {
  $('#main-nav > ul').hide();

  $('.below-nav').on('click', function(){
    $('#main-nav > ul').slideUp();
    $('.below-nav').removeClass( "canvas-blur" )
  });

  $('#menu').on('click', function() {
    event.stopPropagation();
    $('.below-nav').toggleClass("canvas-blur" )
    $('#main-nav > ul').slideToggle('medium');
  });

  // $('#main-nav > ul').on('click', function() {
  //   // event.stopPropagation();
  //   $('#main-nav > ul > ul').slideToggle('medium');
  // });

});
