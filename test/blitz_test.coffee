describe 'Blitz', ->
  blitz = null

  beforeEach ->
    blitz = new Blitz('#blitz')

  afterEach ->
    $('#blitz').empty()

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

    it 'sets the class to notice', ->
      blitz.alert('Yikes!')
      expect(blitz.$wrapper).to.have.class('alert')
      expect(blitz.$wrapper).to.not.have.class('hide')

  describe 'closing', ->
    it 'hides the element', ->
      blitz.notice('Waiting')
      blitz.$close.trigger('click')

      expect(blitz.$wrapper).to.have.class('hide')
