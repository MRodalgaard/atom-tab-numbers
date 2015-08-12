TabNumbersView = require './tab-numbers-view'

module.exports = TabNumbers =
  config:
    showNumberOfOpenTabs:
      type: 'boolean'
      default: true

  activate: ->

  deactivate: ->
    @tabNumbersView?.destroy()
    @tabNumbersView = null
    @statusBarTile?.destroy()
    @statusBarTile = null

  consumeStatusBar: (statusBar) ->
    atom.config.observe 'tab-numbers.showNumberOfOpenTabs', (newValue) =>
      if newValue
        @tabNumbersView ?= new TabNumbersView()
        @statusBarTile = statusBar.addLeftTile(item: @tabNumbersView, priority: 200)
      else
        @deactivate()
