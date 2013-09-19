(function() {
  window.Blitz = (function() {
    Blitz.prototype.blitzTemplate = "<div class=\"blitz hide\">\n  <span class=\"blitz-message\"></span>\n  <span class=\"blitz-spinner hide\"></span>\n  <a href=\"#\" class=\"blitz-close\">&times;</a>\n</div>";

    Blitz.prototype.defaults = {
      autoHideDelay: 0
    };

    function Blitz(container, options) {
      if (options == null) {
        options = {};
      }
      this.container = container;
      this.options = this._defaults(options, this.defaults);
    }

    Blitz.prototype.setOptions = function(options) {
      var key, value, _results;
      _results = [];
      for (key in options) {
        value = options[key];
        _results.push(this.options[key] = value);
      }
      return _results;
    };

    Blitz.prototype.notice = function(message, options) {
      if (options == null) {
        options = {};
      }
      return this._display(message, 'notice', options);
    };

    Blitz.prototype.alert = function(message, options) {
      if (options == null) {
        options = {};
      }
      return this._display(message, 'alert', options);
    };

    Blitz.prototype.hide = function() {
      this.$wrapper.addClass('hide');
      return this.$spinner.addClass('hide');
    };

    Blitz.prototype._display = function(message, kind, options) {
      this._render();
      this._bindDomEvents();
      this._startAutoHide();
      this._toggleSpinner(options.spinner);
      this.$message.text(message);
      return this.$wrapper.addClass(kind).removeClass('hide');
    };

    Blitz.prototype._render = function() {
      if (!this._rendered) {
        this._rendered = true;
        this.$wrapper = $(this.blitzTemplate);
        this.$message = $('.blitz-message', this.$wrapper);
        this.$spinner = $('.blitz-spinner', this.$wrapper);
        this.$close = $('.blitz-close', this.$wrapper);
        return $(this.container).append(this.$wrapper);
      }
    };

    Blitz.prototype._bindDomEvents = function() {
      var self;
      if (!this._domEventsBound) {
        self = this;
        return this.$wrapper.on('click.blitz', '.blitz-close', function(event) {
          return self.hide();
        });
      }
    };

    Blitz.prototype._startAutoHide = function() {
      var callback, self;
      this._clearTimeout();
      if (this.options.autoHideDelay > 0) {
        self = this;
        callback = function() {
          return self.hide();
        };
        return this.autoHideTimeout = setTimeout(callback, this.options.autoHideDelay);
      }
    };

    Blitz.prototype._clearTimeout = function() {
      if (this.autoHideTimeout != null) {
        return clearTimeout(this.autoHideTimeout);
      }
    };

    Blitz.prototype._toggleSpinner = function(show) {
      return this.$spinner.toggleClass('hide', !show);
    };

    Blitz.prototype._defaults = function(options, defaults) {
      var key, value;
      for (key in defaults) {
        value = defaults[key];
        if (options[key] == null) {
          options[key] = defaults[key];
        }
      }
      return options;
    };

    return Blitz;

  })();

}).call(this);
