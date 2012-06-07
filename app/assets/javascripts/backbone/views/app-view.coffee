class AppView extends Backbone.View
  el: '#wrap'

  initialize: (options) ->
    @collection.on 'reset', @render, @


  render: ->
    $el.empty()
    @