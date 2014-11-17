mixin App.ScrollHandler
  onScroll: Ember.K

  attachScrollListener: (->
    @$().on 'scroll', @onScroll.bind @
    ).on 'didInsertElement'

  removeScrollListener: (->
    @$().off 'scroll', @onScroll
    ).on 'willDestroyElement'

  curX: (val) ->
    if val? then @$().scrollLeft(val)
    else @$().scrollLeft()
  curY: (val) ->
    if val? then @$().scrollTop(val)
    else @$().scrollTop()
