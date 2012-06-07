describe "CarpoolerApp", ->
  it "boots", ->
    app = new CarpoolerApp()
    expect(app.booted()).toEqual(true)