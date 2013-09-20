describe 'Blitz', ->
  blitz = null

  beforeEach ->
    $('body').append('<div id="blitz"></div>')
    blitz = new Blitz('#blitz')

  afterEach ->
    $('#blitz, .blitz').remove()

  describe '#notice', ->
    it 'sets the message', ->
      blitz.notice('Hello!')
      expect(blitz.$message).to.contain('Hello!')

    it 'sets the class to notice', ->
      blitz.notice('Hello!')
      expect(blitz.$wrapper).to.have.class('notice')
      expect(blitz.$wrapper).to.not.have.class('hide')

  describe '#alert', ->
    it 'sets the message', ->
      blitz.alert('Yikes!')
      expect(blitz.$message).to.contain('Yikes!')

    it 'sets the class to alert', ->
      blitz.alert('Yikes!')
      expect(blitz.$wrapper).to.have.class('alert')
      expect(blitz.$wrapper).to.not.have.class('hide')

  describe '#success', ->
    it 'sets the message', ->
      blitz.success('Yippee!')
      expect(blitz.$message).to.contain('Yippee!')

    it 'sets the class to success', ->
      blitz.success('Yippee!')
      expect(blitz.$wrapper).to.have.class('success')
      expect(blitz.$wrapper).to.not.have.class('hide')

  describe 'successive messages', ->
    it 'removes any prior message class', ->
      blitz.success('Yippee!')
      blitz.alert('Yippee!')
      blitz.notice('Yippee!')
      expect(blitz.$wrapper).to.not.have.class('success')
      expect(blitz.$wrapper).to.not.have.class('alert')

  describe 'closing', ->
    it 'hides the element', ->
      blitz.notice('Waiting')
      blitz.$close.trigger('click')

      expect(blitz.$wrapper).to.have.class('hide')

  describe 'auto hide', ->
    it 'does not auto-hide when disabled', (done) ->
      blitz.notice('hi', delay: 0)

      callback = ->
        expect(blitz.$wrapper).to.not.have.class('hide')
        done()

      setTimeout(callback, 2)

    it 'auto hides after a delay', (done) ->
      blitz.notice('hi', delay: 1)

      callback = ->
        expect(blitz.$wrapper).to.have.class('hide')
        done()

      setTimeout(callback, 2)

  describe 'spinner', ->
    it 'prepends a spinner when the spinner flag is passed', ->
      blitz.notice('waiting...', spinner: true)

      expect(blitz.$spinner).to.not.have.class('hide')

    it 'does not prepend a spinner without the spinner flag', ->
      blitz.notice('waiting...', spinner: false)

      expect(blitz.$spinner).to.have.class('hide')

    it 'respects the default spinner option', ->
      blitz.setOptions(spinner: true)
      blitz.notice('waiting...')

      expect(blitz.$spinner).to.not.have.class('hide')

  describe 'replace', ->
    it 'appends the dom element without a replace flag', ->
      blitz.notice('replace me')

      expect($('#blitz')).to.have('.blitz')

    it 'replaces the dom element when replace is passed', ->
      blitz.setOptions(replace: true)
      blitz.notice('replace me')

      expect($('body')).to.not.have('#blitz')
