class window.Blitz
  blitzTemplate: """
    <div class="blitz hide">
      <span class="blitz-message"></span>
      <span class="blitz-spinner hide"></span>
      <a href="#" class="blitz-close">&times;</a>
    </div>
  """

  defaults:
    autoHideDelay: 0

  constructor: (container, options = {}) ->
    @container = container
    @options   = @_defaults(options, @defaults)

  setOptions: (options) ->
    @options[key] = value for key, value of options

  notice: (message, options = {}) ->
    @_display(message, 'notice', options)

  alert: (message, options = {}) ->
    @_display(message, 'alert', options)

  hide: ->
    @$wrapper.addClass('hide')
    @$spinner.addClass('hide')

  _display: (message, kind, options) ->
    @_render()
    @_bindDomEvents()
    @_startAutoHide()
    @_toggleSpinner(options.spinner)
    @$message.text(message)
    @$wrapper.addClass(kind).removeClass('hide')

  _render: ->
    unless @_rendered
      @_rendered = true

      @$wrapper = $(@blitzTemplate)
      @$message = $('.blitz-message', @$wrapper)
      @$spinner = $('.blitz-spinner', @$wrapper)
      @$close   = $('.blitz-close',   @$wrapper)

      $(@container).append(@$wrapper)

  _bindDomEvents: ->
    unless @_domEventsBound
      self = @

      @$wrapper.on 'click.blitz', '.blitz-close', (event) ->
        self.hide()

  _startAutoHide: ->
    @_clearTimeout()

    if @options.autoHideDelay > 0
      self     = @
      callback = -> self.hide()

      @autoHideTimeout = setTimeout(callback, @options.autoHideDelay)

  _clearTimeout: ->
    clearTimeout(@autoHideTimeout) if @autoHideTimeout?

  _toggleSpinner: (show) ->
    @$spinner.toggleClass('hide', !show)

  _defaults: (options, defaults) ->
    for key, value of defaults
      options[key] = defaults[key] unless options[key]?

    options
