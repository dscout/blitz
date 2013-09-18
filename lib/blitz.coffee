class window.Blitz
  blitzTemplate: """
    <div class="blitz hide">
      <div class="blitz-wrapper">
        <span class="blitz-message"></span>
        <span class="blitz-spinner"></span>
        <a href="#" class="blitz-close">&times;</a>
      </div>
    </div>
  """

  constructor: (container) ->
    @container = container

  notice: (message) ->
    @_display(message, 'notice')

  alert: (message) ->
    @_display(message, 'alert')

  render: ->
    unless @_rendered
      @_rendered = true

      @$wrapper = $(@blitzTemplate)
      @$message = $('.blitz-message', @$wrapper)
      @$spinner = $('.blitz-spinner', @$wrapper)
      @$close   = $('.blitz-close',   @$wrapper)

      $(@container).append(@$wrapper)

  _display: (message, kind, options) ->
    @render()
    @$message.text(message)
    @$wrapper.addClass(kind).removeClass('hide')
