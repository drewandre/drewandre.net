$(document).ready(function() {
	$('#main-nav > ul').hide();
	$('.work-text').hide();
	$('.work-tools').hide();

	$('.main').on('click', function(e) {
		e.stopPropagation();
		$('#main-nav > ul').slideUp('fast');
		$('.main').removeClass('canvas-blur');
		$('#main-nav').removeClass('menu-box-shadow');
	});

	$('#main-nav').on('click', function(e) {
		$('#main-nav > ul').slideToggle('fast');
		$('#main-nav').toggleClass('menu-box-shadow');
		$('.main').toggleClass('canvas-blur');
	});

	$('#main-nav ul li').on('click', function(e) {
		e.stopPropagation();
		$('#main-nav ul li ul'[0]).slideDown('fast');
	});

	$('.work-link').each(function() {
		$(this).on('mouseenter', function(e) {
			e.stopPropagation();
			$(this)
				.children('div')
				.fadeIn('fast');
			$(this)
				.children('.work-tile')
				.toggleClass('image-darken');
		});

		$(this).on('mouseleave', function(e) {
			e.stopPropagation();
			$(this)
				.children('div')
				.fadeOut('fast');
			$(this)
				.children('.work-tile')
				.toggleClass('image-darken');
		});
	});

	// to allow :active styles to work on Mobile Safari
	document.addEventListener('touchstart', function() {}, true);
});
