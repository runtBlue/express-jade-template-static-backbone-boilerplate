module.exports = (grunt) ->
	grunt.initConfig
		watch:
			gruntfiles:
				files: ['Gruntfile.coffee']
				options:
					reload: true
			coffee:
				files: ['public.resource/**/*.coffee', 'current.resource/**/*.coffee']
				tasks: ['coffee']
			handlebars:
				files: ['public.resource/templates/**/*.hbs']
				tasks: ['handlebars']
			'jade_template':
				files: ['public.resource/templates/**/*.jade']
				tasks: ['jade:template']
			'jade_static':
				files: ['public.resource/*.jade', 'public.resource/partials/**/*.jade']
				tasks: ['jade:static']
			html_files:
				files: ['public/*.html']
			options:
				livereload: true
		jade:
			template:
				options:
					pretty: true
					client: true
					namespace: 'JST'
					processName: (filepath) ->
						pieces = filepath.split("/")
						return pieces[pieces.length - 1].replace(/.jade$/ , '')
				files:
					'public/javascripts/jst-template-jade.js': ['public.resource/templates/**/*.jade']
			static:
				options:
					pretty: true
				files: [{
					'public/index.html': 'public.resource/index.jade'
				},{
					'public/tester.html': 'public.resource/tester.jade'
				},{
					options:
						pretty: true
					expand: true
					cwd: 'public.resource/'
					src: ['*.jade']
					dest: 'public/'
					ext: '.html'
				}]
		connect:
			site: {}
		coffee:
			compile:
				files: [{
					expand: true
					cwd: 'public.resource/'
					src: ['**/*.coffee']
					dest: 'public/'
					ext: '.js'
				},{
					expand: true
					cwd: 'current.resource/'
					src: ['**/*.coffee']
					dest: ''
					ext: '.js'
				}]
	pkg = grunt.file.readJSON 'package.json'
	for t of pkg.devDependencies
		if t.substring(0, 6) is 'grunt-'
			grunt.loadNpmTasks t
	grunt.registerTask 'default', ['coffee', 'connect', 'jade', 'watch']
	# grunt.registerTask 'build', ['coffee', 'watch:default']
	return
