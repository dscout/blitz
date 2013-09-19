module.exports = function(grunt) {
  grunt.initConfig({
    coffee: {
      compile: {
        options: {
          bare: false,
          join: true
        },
        files: {
          'blitz.js': ['lib/blitz.coffee'],
          'test/blitz_test.js': ['test/blitz_test.coffee']
        }
      }
    },

    uglify: {
      options: {
        report: 'min'
      },
      dist: {
        src: 'blitz.js',
        dest: 'blitz.min.js'
      }
    },

    mocha: {
      src: ['test/test.html'],
      options: {
        bail: true,
        log: true,
        run: true,
        mocha: {
          ignoreLeaks: true
        }
      }
    },

    sass: {
      dist: {
        options: {
          outputStyle: 'nested'
        },
        files: {
          'blitz.css': 'blitz.scss'
        }
      }
    },

    watch: {
      scripts: {
        files: ['lib/*.coffee', 'test/*.coffee'],
        tasks: ['coffee:compile']
      },
      sass: {
        files: ['*.scss'],
        tasks: ['sass']
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-sass');
  grunt.loadNpmTasks('grunt-mocha');

  grunt.registerTask('default', ['coffee:compile', 'sass', 'mocha']);
  grunt.registerTask('release', ['default', 'uglify']);
};
