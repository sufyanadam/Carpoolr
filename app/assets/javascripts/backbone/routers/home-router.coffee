class HomeRouter extends Backbone.Router
  routes:
    '': 'home'
  initialize: ->
    @view = new app.AppView collection: app.Tasks

@app = window.app ? {}
@app.HomeRouter = HomeRouter