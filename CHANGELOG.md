# v0.7.1

* Don't error on hide if the message was never rendered.

# v0.7.0

* Display html rather than pure text. Prevents sanitizing `b`, `a` elements.
* Prevent event bubbling when clicking "hide".

# v0.6.1

* Wrap internal markup for finer control. This is particularly useful for
  having a full width notification while keeping the text mostly centered.
* Remove any prior message classes when displaying new messages.

# v0.6.0

* Precompile SCSS instead of vanilla CSS.
* Add a `success` method for happy notifications.
* Display options, not render options, can be passed at display time to
  override.
* Rename `autoHideDelay` to simply `delay`. No other delays are predicted.
* Allow configuration of append or replace. By passing a `replace` option you
  can entirely replace the container element with the rendered element.

# v0.5.0

Initial release with these features:

* Notice and Alert methods and styling
* Auto-hide after a delay
* Pure CSS spinner support
