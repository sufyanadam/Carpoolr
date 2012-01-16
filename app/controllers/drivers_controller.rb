class DriversController < ApplicationController
  
  def new
  end

  def create
    session[:driver_id] = Driver.create!(params[:driver]).id
    redirect_to :action => :waiting
  end

  def waiting
    @driver = Driver.find_by_id(session[:driver_id])
    return redirect_to root_path unless @driver
    @driver.seen!
  end

  def destroy
    @driver = Driver.find_by_id(session[:driver_id])
    @driver.destroy if @driver
    redirect_to root_path
  end

end
