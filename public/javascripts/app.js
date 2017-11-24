$('#main-nav').mouseenter(function() {
  $('canvas').css({
    filter: 'blur(10px)'
  });
  $('.home-centered').css({
    filter: 'blur(10px)'
  });
});

$('#main-nav').mouseleave(function() {
  $('canvas').css({
    filter: 'blur(1px)'
  });
  $('.home-centered').css({
    filter: 'none'
  });
});
