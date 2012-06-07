@app = window.app ? {}

jQuery ->
  @app.router = new app.HomeRouter
  Backbone.history.start({pushState: true})