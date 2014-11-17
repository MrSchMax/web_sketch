class App.WorkspaceRoute extends Ember.Route

class App.WorkspaceController extends Ember.Controller
  canvas: null

  init: ->
    @canvas = App.Canvas.create()

  actions:
    consoleWorkspace: -> console.log "Click on Workspace"



class App.WorkspaceView extends Ember.View
  classNames: ['workspace-section']
