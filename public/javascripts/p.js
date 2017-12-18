var TAU,
	button,
	canvas,
	ctx,
	draw,
	f,
	fpselem,
	h,
	p1,
	particles,
	period,
	raf,
	w,
	_i,
	menu,
	pausePerlin = false;
var lastResize = 0;
canvas = document.getElementsByTagName('canvas')[0];
main = document.getElementsByClassName('main')[0];
menu_icon = document.getElementById('menu-icon')[0];
menu = document.getElementById('menu');
fpselem = document.getElementById('fps');
w = canvas.width = document.body.clientWidth;
h = canvas.height = document.body.clientHeight;
TAU = 2 * Math.PI;
ctx = canvas.getContext('2d');

randomWithRange = function(min, max) {
	var range = max - min + 1;
	return Math.random() * range + min;
};

period = 1 / randomWithRange(280, 650);

noise.seed(Math.random());

particles = [];

for (_i = 1; _i <= 1000; _i++) {
	p1 = {
		x: w * 0.25 + Math.random() * w * 0.5,
		y: h * 0.3 + Math.random() * h * 0.4,
		a: 0
	};
	particles.push(p1);
	particles.push({
		x: p1.x,
		y: p1.y,
		a: TAU / 2
	});
}

draw = function() {
	if (Date.now() - lastResize > 200) {
		if (!pausePerlin) {
			var a, p, v, _j, _len, _results;
			_results = [];
			for (_j = 0, _len = particles.length; _j < _len; _j++) {
				p = particles[_j];
				v = noise.perlin2(p.x * period, p.y * period);
				p.h++;
				ctx.fillStyle =
					'hsla(' +
					Math.floor(v * randomWithRange(100, 300)) +
					', 100%, 80%, 0.2)';
				ctx.fillRect(p.x, p.y, 1.5, 1.5);
				a = v * 2.5 * Math.PI + p.a;
				p.x += Math.cos(a);
				_results.push((p.y += Math.sin(a)));
			}
			return _results;
		}
	}
};

reset = function() {
	canvas = document.getElementsByTagName('canvas')[0];
	fpselem = document.getElementById('fps');
	w = canvas.width = document.body.clientWidth;
	h = canvas.height = document.body.clientHeight;
	TAU = 2 * Math.PI;
	ctx = canvas.getContext('2d');
	period = 1 / 500;
	noise.seed(Math.random());
	particles = [];
	for (_i = 1; _i <= 1000; _i++) {
		p1 = {
			x: w * 0.25 + Math.random() * w * 0.5,
			y: h * 0.3 + Math.random() * h * 0.4,
			a: 0
		};
		particles.push(p1);
		particles.push({
			x: p1.x,
			y: p1.y,
			a: TAU / 2
		});
	}
};

pauseAnimation = function(bool) {
	pausePerlin = bool;
};

raf =
	window.requestAnimationFrame ||
	window.webkitRequestAnimationFrame ||
	window.mozRequestAnimationFrame ||
	window.oRequestAnimationFrame ||
	window.msRequestAnimationFrame ||
	function(callback) {
		return window.setTimeout(callback, 1000 / 60);
	};

window.addEventListener('resize', function(e) {
	lastResize = Date.now();
	return reset();
});

main.addEventListener('click', function() {
	if ((pausePerlin = true)) {
		pausePerlin = false;
	}
	$('#main-nav').css({ boxShadow: 'none' });
	$('.main').removeClass('canvas-blur');
	return pauseAnimation(pausePerlin);
});

menu.addEventListener('click', function(e) {
	$('.main').toggleClass('canvas-blur');
	$('#main-nav').css({ boxShadow: '0px 0px 15px rgba(0, 0, 0, 0.35)' });
	return pauseAnimation(!pausePerlin);
});

f = function() {
	raf(f);
	// pauseAnimation(true);
	return draw();
};

raf(f);
