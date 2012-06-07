require 'spec_helper'

describe DriversController do
  describe "#create" do

    before do 
      @options = { :driver => {:pickup_spot_id => PickupSpot.create!(:name => "Richmond Pkwy").id } }
    end
    
    it "creates a driver" do
      lambda {
        post :create, @options
      }.should change{ Driver.count }.by +1
    end
    
    it "redirects to waiting" do
      post :create, @options
      response.should redirect_to "/drivers/waiting"
      session[:driver_id].should == Driver.last.id
    end
  end

  describe "#waiting"  do
    it "renders" do
      session[:driver_id] = Driver.create!(:pickup_spot_id => PickupSpot.create!.id ).id
      get :waiting
      response.should render_template "waiting"
    end

    it "redirects if there is no rider" do
      get :waiting
      response.should redirect_to "/"
    end
  end
end
