class App.CanvasElemComponent extends Ember.Component with App.ScrollHandler, App.ResizeHandler
  classNames: ['canvas-box']

  +computed canvas.width, canvas.height
  style: -> "width: #{@canvas.width}px; height: #{@canvas.height}px;"

  setup: (->
    @boxWidth = @$().width()
    @boxHeight = @$().height()

    @canvas.defHeight = 3 * @boxHeight
    @canvas.defWidth = 3 * @boxWidth

    @canvas.x = @canvas.nullX
    @canvas.y = @canvas.nullY
    ).on 'didInsertElement'

  onResize: ->
    @canvas.boxWidth = @$().width()
    @canvas.boxHeight = @$().height()

  onScroll: ->

    # changeLeft
    if @curX() < 1
      @canvas.left = @canvas.left + 1
      @curX(@curX() + 1)
    if @canvas.left > 0 and @curX() - @canvas.left > 1
      @canvas.left = @canvas.left - 1
      @curX(@curX() - 1)

    # changeBottom
    if @curX() >= @canvas.width - @canvas.boxWidth
      @canvas.right = @canvas.right + 1
    if @canvas.right > 0 and @canvas.width - @curX() - @canvas.boxWidth > 1
      @canvas.right = @canvas.right - 1

    # changeTop
    if @curY() < 1
      @canvas.top = @canvas.top + 1
      @curY(@curY() + 1)
    if @canvas.top > 0 and @curY() - @canvas.top > 1
      @canvas.top = @canvas.top - 1
      @curY(@curY() - 1)

    # changeBottom
    if @curY() >= @canvas.height - @canvas.boxHeight
      @canvas.bottom = @canvas.bottom + 1
    if @canvas.bottom > 0 and @canvas.height - @curY() - @canvas.boxHeight > 1
      @canvas.bottom = @canvas.bottom - 1

    @canvas.x = @curX()
    @canvas.y = @curY()

  +observer canvas.x
  scrollToX: -> @$().scrollLeft @canvas.x

  +observer canvas.y
  scrollToY: -> @$().scrollTop @canvas.y
