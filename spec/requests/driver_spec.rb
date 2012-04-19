require 'spec_helper'

describe "driver", :js => true do
  it "registers a new driver" do
    PickupSpot.create!(:name => "Richmond Pkwy")

    visit '/'
    page.find('a[href="/drivers/new"]').click
    expect{
      click_link "Richmond Pkwy"
    }.to change{ Driver.count }.by(+1)

    current_path.should == "/drivers/waiting"
    page.should have_content "You're all set"

    expect {
      click_link "Refresh"
    }.to change{ Driver.last.last_seen_at }

  end
end
