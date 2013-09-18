# Blitz (fl•ash)

1. verb - Shine in a bright but brief, sudden, or intermittent way
2. noun - Control the display of temporary messages

## Development

The project is built via [Grunt](http://gruntjs.com) and depdends on packages
installed with [Bower](http://bower.io). To contribute you'll need both
packages installed along with all required bower components.

```bash
npm install -g grunt-cli
npm install -g bower
npm install
bower install --dev
```

Once grunt, grunt-contrib, and bower components are installed you're all set to
compile, test, or release (compile minified).

```bash
grunt         # compile, test
grunt release # compile, test, minify
grunt watch   # compile lib and test on any change
```

## License

MIT, see `LICENSE.txt` for details.
