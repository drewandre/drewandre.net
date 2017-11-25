$(document).ready(function() {
  $('#main-nav > ul').hide();

  $(document).on('click touchstart', function(){
    $('#main-nav > ul').slideUp();
    $('.below-nav').removeClass( "canvas-blur" )
  });

  $('#main-nav').on('click touchstart', function() {
    event.stopPropagation();
    $('.below-nav').toggleClass( "canvas-blur" )
    $('#main-nav > ul').slideToggle('medium');
  });

});
