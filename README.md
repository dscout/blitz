[![Build Status](https://travis-ci.org/dscout/blitz.png?branch=master)](https://travis-ci.org/dscout/blitz)

# Blitz (fl•ash)

1. verb - Shine in a bright but brief, sudden, or intermittent way
2. noun - Control the display of temporary messages

![Blitz Example](http://assets-dscoutapp-com.s3.amazonaws.com/blitz_sample.png)

## Installation

Blitz can be installed using bower under the package name `blitz-alert`:

```bash
bower install blitz-alert
```

## Usage

Blitz is instantiated using a constructor:

```javascript
var blitz = new Blitz('#container');
```

Nothing will be rendered until you ask it to display a message, at which point
it will inject itself into the container and display a `notice` or `alert`
style message.

Here is an example of using blitz to display an alert with a spinner and an
auto-hide delay:

```javascript
var blitz = new Blitz('body');

$.getJSON("http://www.bogus.url").fail(function() {
  blitz.alert("You've made a huge mistake", { delay: 5000, spinner: true });
});
```

It is common for `flash` messages to be written to the page during a Rails
request. With blitz you can easily display that message in an easily dismissed
and auto-hiding container:

```html
<body>
  <div id="flash" data-message="Oopsy Daisy" data-type="alert"></div>

  <script>
    var blitz   = new Blitz('#flash', { replace: true, delay: 5000 })
      , $flash  = $('#flash')
      , type    = $flash.attr('data-type')
      , message = $flash.attr('data-message')

    blitz[type](message)
  </script>
</body>
```

Notifications all behave the same way, but have a different theme. Currently
the notification types are `success`, `notice`, and `alert`. Each is used like so:

```javascript
var blitz = new Blitz('#flash');

blitz.success("That worked out splendidly!");
blitz.notice("You're signed in, just wanted you to know")
blitz.alert("Uh oh. That can't be good")
```

## Options

### delay

`number` - Configures the amount of time in milliseconds until the notification
will auto-hide. Does not auto-hide with a value of 0 or less.

### spinner

`boolean` - Determines whether a spinner will be displayed for the duration of
the notification.

### replace

`boolean` - If enabled the container element provided to the constructor will
be entirely replaced when blitz is rendered. Otherwise the markup is appended.

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
