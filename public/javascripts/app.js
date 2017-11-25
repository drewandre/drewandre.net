$(document).ready(function() {
  $('#main-nav > ul').hide();

  $(document).click( function(){
    $('#main-nav > ul').slideUp();
    $('.below-nav').removeClass( "canvas-blur" )
  });

  $('#main-nav').click(function() {
    event.stopPropagation();
    $('.below-nav').toggleClass( "canvas-blur" )
    $('#main-nav > ul').slideToggle('medium');
  });

});
