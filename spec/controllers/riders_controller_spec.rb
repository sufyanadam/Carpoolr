require 'spec_helper'

describe RidersController do
  describe "#create" do
    it "creates a rider" do
      lambda {
        post :create 
      }.should change{ Rider.count }.by +1
    end
    
    it "redirects to waiting" do
      post :create
      response.should redirect_to "/riders/waiting"
      session[:rider_id].should == Rider.last.id
    end
  end
  
  describe "#waiting" do 
    it "should render" do
      session[:rider_id] = Rider.create!.id
      get :waiting
      response.should render_template "waiting"
    end
    
    it "should redirect if there is no rider" do
      get :waiting
      response.should redirect_to "/"
    end

    it "should update my last_seen_at" do
      session[:rider_id] = Rider.create!(:last_seen_at => 1.hour.ago).id
      get :waiting

      Rider.last.last_seen_at.should > 10.seconds.ago
    end
  end
  
  describe "destroy" do
    it "deletes a rider" do
      rider = Rider.create
      session[:rider_id] = rider.id
      lambda {
        delete :destroy, :id => rider.id
      }.should change { Rider.count }.by -1
    end

    it "should redirect to root" do
      redirect_to root_path
    end

    it "should not delete unauthenticated rider" do
      rider = Rider.create!
      lambda {
        delete :destroy, :id => rider.id
      }.should_not change { Rider.count }
    end
  end
end
