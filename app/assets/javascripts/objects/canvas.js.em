class App.Canvas

  # DEFAULTs
  left: 0
  right: 0

  top: 0
  bottom: 0

  defWidth:  10000
  defHeight: 10000

  # NULL POINT
  +computed defWidth
  defNullX: -> 0.4 * @defWidth
  +computed defHeight
  defNullY: -> 0.4 * @defHeight

  +computed defNullX, left
  nullX: -> @defNullX + @left
  +computed defNullY, top
  nullY: -> @defNullY + @top

  # WIDTH AND HEIGHT
  +computed defWidth, left, right
  width: -> @defWidth + @left + @right
  +computed defWHeight, top, bottom
  height: -> @defHeight + @top + @bottom

  # CURRENT POSITION
  x: 0
  y: 0

  boxWidth: 0
  boxHeight: 0


class App.Canvas2

  # SELF PROPERTIES
  left: 0
  right: 0

  top: 0
  bottom: 0

  # FROM OUTSIDE
  scale: 1

  # minX: 0
  # maxX: 0
  #
  # minY: 0
  # maxY: 0

  minX: -5000
  maxX: 5000

  minY: -5000
  maxY: 5000

  defWidth:  10000
  defHeight: 10000

  factorWidth:  3
  factorHeight: 3

  # FROM VIEW
  curX: 0
  curY: 0

  boxWidth:  0
  boxHeight: 0

  # COMPUTED PROPERTIES

  ## Min Size
  +computed boxWidth, defWidth, factorWidth
  minWidth: ->
    if @boxWidth > 0 then Math.ceil @factorWidth*@boxWidth
    else @defWidth

  +computed boxHeight, defHeight, factorHeight
  minHeight: ->
    if @boxHeight > 0 then Math.ceil @factorHeight*@boxHeight
    else @defHeight

  ## Scaled minX, maxX, minY, maxY
  +computed minX, scale
  sMinX: -> if @scale > 0 then Math.ceil @scale * @minX else @minX

  +computed maxX, scale
  sMaxX: -> if @scale > 0 then Math.ceil @scale * @maxX else @maxX

  +computed minY, scale
  sMinY: -> if @scale > 0 then Math.ceil @scale * @minY else @minY

  +computed maxY, scale
  sMaxY: -> if @scale > 0 then Math.ceil @scale * @maxY else @maxY

  ## Def Null Point
  +computed minWidth
  defNullX: -> Math.ceil 0.5 * @minWidth

  +computed minHeight
  defNullY: -> Math.ceil 0.5 * @minHeight

  ## Scaled Null Point
  +computed defNullX, scale
  sDefNullX: -> if @scale > 0 then Math.ceil @defNullX / @scale else @defNullX

  +computed defNullY, scale
  sDefNullY: -> if @scale > 0 then Math.ceil @defNullY / @scale else @defNullY

  ## Null Point
  +computed defNullX, dMinX, left
  nullX: -> @defNullX + @dMinX + @left

  +computed defNullY, dMinY, top
  nullY: -> @defNullY + @dMinY + @top

  ## Deltas minX, maxX, minY, maxY
  +computed sMinX, sDefNullX
  dMinX: ->
    val = - @sMinX - @sDefNullX
    if val > 0 then val else 0

  +computed sMaxX, minWidth, scale
  dMaxX: ->
    val = @sMaxX - Math.ceil (@minWidth - @defNullX) / @scale
    if val > 0 then val else 0

  +computed sMinY, sDefNullY
  dMinY: ->
    val = - @sMinY - @sDefNullY
    if val > 0 then val else 0

  +computed sMaxY, minHeight, scale
  dMaxY: ->
    val = @sMaxY - Math.ceil (@minHeight - @defNullY) / @scale
    if val > 0 then val else 0

  ## Pref Size
  +computed minWidth, dMinX, dMaxX
  prefWidth: -> @minWidth + @dMinX + @dMaxX

  +computed minHeight, dMinY, dMaxY
  prefHeight: -> @minHeight + @dMinY + @dMaxY

  ## width and height
  +computed prefWidth, left, right
  width: -> @prefWidth + @left + @right

  +computed prefHeight, top, bottom
  height: -> @prefHeight + @top + @bottom

  ## Functions
  toTL: (x = 0, y = 0, dx = 0, dy = 0) ->
    @curX = @nullX + x + dx
    @curY = @nullY + y + dy

    curX: @curX
    curY: @curY

  objectToTL: (obj = null, dx = 0, dy = 0) ->
    x = 0
    y = 0

    if obj.x? then x = obj.x
    if obj.y? then y = obj.y

    @toTL(x, y, dx, dy)













canvas = new App.Canvas2()

console.log "minWidth: #{canvas.minWidth}"
console.log "minHeight: #{canvas.minHeight}"

# canvas.boxWidth = 1920
# canvas.boxHeight = 1080
# canvas.boxWidth = 1000
# canvas.boxHeight = 1000
canvas.boxWidth = 1001
canvas.boxHeight = 1001


console.log "boxWidth: #{canvas.boxWidth}"
console.log "boxHeight: #{canvas.boxHeight}"

console.log '__________________________________________________'

console.log "factorWidth: #{canvas.factorWidth}"
console.log "factorHeight: #{canvas.factorHeight}"

console.log "minWidth: #{canvas.minWidth}"
console.log "minHeight: #{canvas.minHeight}"

console.log "defNullX: #{canvas.defNullX}"
console.log "defNullY: #{canvas.defNullY}"

console.log '__________________________________________________'

canvas.factorWidth = 2
canvas.factorHeight = 1

console.log "factorWidth: #{canvas.factorWidth}"
console.log "factorHeight: #{canvas.factorHeight}"

console.log "minWidth: #{canvas.minWidth}"
console.log "minHeight: #{canvas.minHeight}"

console.log "defNullX: #{canvas.defNullX}"
console.log "defNullY: #{canvas.defNullY}"

console.log '__________________________________________________'

canvas.factorWidth = 3
canvas.factorHeight = 3

console.log "scale: #{canvas.scale}"

console.log "minX: #{canvas.minX}, maxX: #{canvas.maxX}, minY: #{canvas.minY}, maxY: #{canvas.maxY}"

console.log "sMinX: #{canvas.sMinX}, sMaxX: #{canvas.sMaxX}, sMinY: #{canvas.sMinY}, sMaxY: #{canvas.sMaxY}"

console.log "dMinX: #{canvas.dMinX}, dMaxX: #{canvas.dMaxX}, dMinY: #{canvas.dMinY}, dMaxY: #{canvas.dMaxY}"

console.log "prefWidth: #{canvas.prefWidth}; prefHeight: #{canvas.prefHeight}"

console.log "defNullX: #{canvas.defNullX}"
console.log "defNullY: #{canvas.defNullY}"

console.log "sDefNullX: #{canvas.sDefNullX}"
console.log "sDefNullY: #{canvas.sDefNullY}"

console.log "nullX: #{canvas.nullX}"
console.log "nullY: #{canvas.nullY}"

console.log '__________________________________________________'

canvas.scale = 2

console.log "scale: #{canvas.scale}"

console.log "minX: #{canvas.minX}, maxX: #{canvas.maxX}, minY: #{canvas.minY}, maxY: #{canvas.maxY}"
console.log "sMinX: #{canvas.sMinX}, sMaxX: #{canvas.sMaxX}, sMinY: #{canvas.sMinY}, sMaxY: #{canvas.sMaxY}"

console.log "dMinX: #{canvas.dMinX}, dMaxX: #{canvas.dMaxX}, dMinY: #{canvas.dMinY}, dMaxY: #{canvas.dMaxY}"

console.log "prefWidth: #{canvas.prefWidth}; prefHeight: #{canvas.prefHeight}"

console.log "defNullX: #{canvas.defNullX}"
console.log "defNullY: #{canvas.defNullY}"

console.log "sDefNullX: #{canvas.sDefNullX}"
console.log "sDefNullY: #{canvas.sDefNullY}"

console.log "nullX: #{canvas.nullX}"
console.log "nullY: #{canvas.nullY}"

console.log '__________________________________________________'

canvas.scale = 0.5

console.log "scale: #{canvas.scale}"

console.log "minX: #{canvas.minX}, maxX: #{canvas.maxX}, minY: #{canvas.minY}, maxY: #{canvas.maxY}"

console.log "sMinX: #{canvas.sMinX}, sMaxX: #{canvas.sMaxX}, sMinY: #{canvas.sMinY}, sMaxY: #{canvas.sMaxY}"

console.log "dMinX: #{canvas.dMinX}, dMaxX: #{canvas.dMaxX}, dMinY: #{canvas.dMinY}, dMaxY: #{canvas.dMaxY}"

console.log "prefWidth: #{canvas.prefWidth}; prefHeight: #{canvas.prefHeight}"

console.log "defNullX: #{canvas.defNullX}"
console.log "defNullY: #{canvas.defNullY}"

console.log "sDefNullX: #{canvas.sDefNullX}"
console.log "sDefNullY: #{canvas.sDefNullY}"

console.log "nullX: #{canvas.nullX}"
console.log "nullY: #{canvas.nullY}"

console.log '__________________________________________________'

console.log canvas.toTL()
console.log canvas.toTL(100, 100, -50, -50)

obj =
  x: 100
  y: 100
  width: 200
  height: 200

console.log canvas.objectToTL(obj, -50, -50)
console.log canvas.objectToTL()
