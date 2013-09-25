class window.Blitz
  @VERSION: '0.6.1'

  blitzTemplate: """
    <div class="blitz hide">
      <div class="blitz-inner-wrapper">
        <span class="blitz-message"></span>
        <span class="blitz-spinner hide"></span>
        <a href="#" class="blitz-close">&times;</a>
      </div>
    </div>
  """

  defaults:
    delay: 0
    replace: false
    spinner: false

  constructor: (container, options = {}) ->
    @container = container
    @options   = @_defaults(options, @defaults)

  setOptions: (options) ->
    @options[key] = value for key, value of options

  notice: (message, options = {}) ->
    @_display(message, 'notice', options)

  alert: (message, options = {}) ->
    @_display(message, 'alert', options)

  success: (message, options = {}) ->
    @_display(message, 'success', options)

  hide: ->
    @$wrapper.addClass('hide')
    @$spinner.addClass('hide')

  _display: (message, kind, options) ->
    options = @_defaults(options, @options)

    @_render(options.replace)
    @_bindDomEvents()
    @_startAutoHide(options.delay)
    @_toggleSpinner(options.spinner)
    @$message.text(message)
    @$wrapper.removeClass('hide notice alert success').addClass(kind)

  _render: ->
    unless @_rendered
      @_rendered = true

      @$wrapper = $(@blitzTemplate)
      @$message = $('.blitz-message', @$wrapper)
      @$spinner = $('.blitz-spinner', @$wrapper)
      @$close   = $('.blitz-close',   @$wrapper)

      if @options.replace
        $(@container).replaceWith(@$wrapper)
      else
        $(@container).append(@$wrapper)

  _bindDomEvents: ->
    unless @_domEventsBound
      self = @

      @$wrapper.on 'click.blitz', '.blitz-close', (event) ->
        self.hide()
        false

  _startAutoHide: (delay) ->
    @_clearTimeout()

    if delay > 0
      self     = @
      callback = -> self.hide()

      @autoHideTimeout = setTimeout(callback, delay)

  _clearTimeout: ->
    clearTimeout(@autoHideTimeout) if @autoHideTimeout?

  _toggleSpinner: (show) ->
    @$spinner.toggleClass('hide', !show)

  _defaults: (options, defaults) ->
    for key, value of defaults
      options[key] = defaults[key] unless options[key]?

    options
