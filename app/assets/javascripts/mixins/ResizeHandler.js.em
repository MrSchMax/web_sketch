mixin App.ResizeHandler
  onResize: Ember.K

  attachResizeListener: (->
    @$().resize @onResize.bind @
    ).on 'didInsertElement'

  removeResizeListener: (->
    @$().removeResize @onResize
    ).on 'willDestroyElement'
