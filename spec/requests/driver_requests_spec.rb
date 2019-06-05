require 'spec_helper'

def click_new_driver
  Capybara.page.find('a[href="/drivers/new"]').click
end

describe "driver", :js => true do
  def simulate_location(lat, lng)
    Capybara.page.execute_script <<-JS
      window.navigator.geolocation.getCurrentPosition = function(success){
        var position = {"coords" : { "latitude": "#{lat}", "longitude": "#{lng}" }};
        success(position);
      }
    JS
  end

  it "registers a new driver" do
    PickupSpot.create!(name: "Richmond Pkwy")
    DestinationSpot.create!(name: 'San Francisco')

    Capybara.visit '/'
    click_new_driver
    expect{
      Capybara.click_link "Richmond Pkwy"
    }.to change{ Driver.count }.by(+1)

    Capybara.current_path.should == "/drivers/waiting"
    Capybara.page.should have_content "You're all set"

    expect {
      Capybara.click_link "Refresh"
    }.to change{ Driver.last.last_seen_at }
  end
end
