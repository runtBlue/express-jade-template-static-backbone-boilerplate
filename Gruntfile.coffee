module.exports = (grunt) ->
	grunt.initConfig
		watch:
			coffee:
				files: ['public.resource/**/*.coffee'
					'current.resource/**/*.coffee']
				task: ['coffee']
			handlebars:
				files: ['public.resource/templates/**/*.hbs']
				task: ['handlebars']
			html_files:
				files: ['public/*.html']
			options:
				livereload: true
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
		handlebars:
			compile:
				namespace: 'JST'
				files:
					'public/javascripts/jst-template.js': ['public.resource/templates/**/*.hbs']
	pkg = grunt.file.readJSON 'package.json'
	for t of pkg.devDependencies
		if t.substring(0, 6) is 'grunt-'
			grunt.loadNpmTasks t
	grunt.registerTask 'default', ['coffee', 'handlebars', 'connect', 'watch']
	# grunt.registerTask 'build', ['coffee', 'watch:default']
	return
