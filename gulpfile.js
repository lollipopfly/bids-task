var gulp         = require('gulp'),
	postcss      = require('gulp-postcss'),
	browserSync  = require('browser-sync').create(),
	sass         = require('gulp-sass'),
	slim         = require("gulp-slim"),
	size         = require('postcss-size'),
	pxtorem      = require('postcss-pxtorem'),
	autoprefixer = require('autoprefixer'),
	concat       = require('gulp-concat'),
	uglify       = require('gulp-uglify'),
	selectors    = require('postcss-custom-selectors'),
	plumber      = require('gulp-plumber'),
	notify       = require("gulp-notify");

/*------------------------------------*\
    Slim
\*------------------------------------*/

gulp.task('slim', function(){
  gulp.src("./src/slim/*.slim")
    .pipe(slim({
      pretty: true
    }))
    .pipe(gulp.dest(""));
});

/*------------------------------------*\
	Sass
\*------------------------------------*/

gulp.task('sass', function() {
	var processors = [
	autoprefixer({ browsers: ['last 20 versions'] }),
		selectors,
		size,
		pxtorem({
			replace: true
		})
];

  return gulp.src([
  		  'public/css/bootstrap.min.css',
		  'src/sass/_main.scss',
		  'src/sass/style.scss',])
	.pipe(concat('style.css'))
	.pipe(sass().on('error', error))
	.pipe(sass({outputStyle: 'compressed'}))
	.pipe(postcss(processors))
	.pipe(gulp.dest('dist/css/'));
});


/*------------------------------------*\
    Uglify
\*------------------------------------*/

gulp.task('compress', function() {
	return gulp.src([
					'public/js/jquery.js',
					'public/js/bootstrap.min.js',
					'public/js/common.js'])
		.pipe(plumber())
		.pipe(concat('global.min.js'))
		.pipe(uglify())
		.pipe(gulp.dest('dist/js/'));
});


/*------------------------------------*\
	Borwsersync server
\*------------------------------------*/

gulp.task('serve', ['sass'], function() {
	browserSync.init({
	server: ""
	});

	gulp.watch("public/css/style.css").on('change', browserSync.reload);
	gulp.watch("index.html").on('change', browserSync.reload);
});

/*------------------------------------*\
	Watch
\*------------------------------------*/

gulp.task('watch', function() {
	gulp.watch('src/slim/**/*.slim', { interval: 500 }, ['slim', 'notify']);
	gulp.watch('src/sass/**/*.scss', { interval: 500 }, ['sass', 'notify']);
	gulp.watch('public/js/common.js', { interval: 500 }, ['compress', 'notify']);
});

/*------------------------------------*\
	Notify
\*------------------------------------*/

gulp.task('notify', function(a) {
  var date = new Date();
  gulp.src("dist/css/style.css")
  .pipe(notify("Css was compiled! at " + date));
});

/*------------------------------------*\
	Run default gulp tasks
\*------------------------------------*/

gulp.task('default', ['sass', 'slim', 'compress', 'watch']);


/**
***************************************************************
* =FUNCTIONS
***************************************************************
**/

// function like a plumber js
function error(error) {
  console.log(error.toString());
  this.emit('end');
}

