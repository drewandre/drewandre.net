$('#main-nav').mouseenter(function() {
  $('#below-nav').css({
    filter: 'blur(10px)'
  });
});

$('#main-nav').mouseleave(function() {
  $('#below-nav').css({
    filter: 'none'
  });
});
