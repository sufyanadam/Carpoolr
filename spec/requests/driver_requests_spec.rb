require 'spec_helper'

def click_new_driver
  page.find('a[href="/drivers/new"]').click
end

describe "driver", :js => true do
  def simulate_location(lat, lng)
    page.driver.browser.execute_script <<-JS
      window.navigator.geolocation.getCurrentPosition = function(success){
        var position = {"coords" : { "latitude": "#{lat}", "longitude": "#{lng}" }};
        success(position);
      }
    JS
  end

  it "registers a new driver" do
    PickupSpot.create!(:name => "Richmond Pkwy")

    visit '/'
    click_new_driver
    expect{
      click_link "Richmond Pkwy"
    }.to change{ Driver.count }.by(+1)

    current_path.should == "/drivers/waiting"
    page.should have_content "You're all set"

    expect {
      click_link "Refresh"
    }.to change{ Driver.last.last_seen_at }
  end

  it "can instant sign up via geolocation" do
    PickupSpot.create!(:name => "X1", :lat => 10, :lng => 10)
    center = PickupSpot.create!(:name => "X2", :lat => 20, :lng => 20)
    PickupSpot.create!(:name => "X3", :lat => 30, :lng => 30)

    visit '/?slow_location=true'
    simulate_location 20, 20

    sleep 0.2
    sleep 10
    expect{
      click_new_driver
    }.to change{ Driver.count }.by(+1)

    current_path.should == "/drivers/waiting"
    page.should have_content "You're all set"

    Driver.last.pickup_spot.should == center
  end
end
