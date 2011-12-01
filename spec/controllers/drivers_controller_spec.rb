require 'spec_helper'

describe DriversController do
  describe "#create" do
    it "creates a driver" do
      lambda {
        post :create
      }.should change{ Driver.count }.by +1
    end
    
    it "redirects to waiting" do
      post :create
      response.should redirect_to "/drivers/waiting"
      session[:driver_id].should == Driver.last.id
    end
  end

  describe "#waiting" do
    it "should render" do
      session[:driver_id] = Driver.create!.id
      get :waiting
      response.should render_template "waiting"
    end

    it "should redirect if there is no rider" do
      get :waiting
      response.should redirect_to "/"
    end
  end
end
