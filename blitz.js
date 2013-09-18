(function() {
  window.Blitz = (function() {
    Blitz.prototype.blitzTemplate = "<div class=\"blitz hide\">\n  <div class=\"blitz-wrapper\">\n    <span class=\"blitz-message\"></span>\n    <span class=\"blitz-spinner\"></span>\n    <a href=\"#\" class=\"blitz-close\">&times;</a>\n  </div>\n</div>";

    function Blitz(container) {
      this.container = container;
    }

    Blitz.prototype.notice = function(message) {
      return this._display(message, 'notice');
    };

    Blitz.prototype.alert = function(message) {
      return this._display(message, 'alert');
    };

    Blitz.prototype.render = function() {
      if (!this._rendered) {
        this._rendered = true;
        this.$wrapper = $(this.blitzTemplate);
        this.$message = $('.blitz-message', this.$wrapper);
        this.$spinner = $('.blitz-spinner', this.$wrapper);
        this.$close = $('.blitz-close', this.$wrapper);
        return $(this.container).append(this.$wrapper);
      }
    };

    Blitz.prototype._display = function(message, kind, options) {
      this.render();
      this.$message.text(message);
      return this.$wrapper.addClass(kind).removeClass('hide');
    };

    return Blitz;

  })();

}).call(this);
