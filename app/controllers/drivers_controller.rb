class DriversController < ApplicationController
  def new
    if location = cookies[:location]
      lat, lng = location.split('--').map(&:to_f)

      go_to_spot PickupSpot.find_closest(lat, lng)
    end
  end

  def create
    driver = params[:driver]
    
    if driver[:destination_spot_id]
      sf_create(driver)
    else
      go_to_spot PickupSpot.find_by_id(driver[:pickup_spot_id])
    end
  end

  def sf_create(driver)
    @destination_spot = DestinationSpot.find_by_id(driver[:destination_spot_id])
    sf_pickup_spot_id = PickupSpot.find_by_name("San Francisco").id
    @driver = Driver.create!(:pickup_spot_id => sf_pickup_spot_id, :destination_spot => @destination_spot)
    session[:driver_id] = @driver.id
    return redirect_to :action => :sf_waiting
  end

  def set_destination_spot
  end

  def waiting
    @driver = Driver.find_by_id(session[:driver_id])
    return redirect_to root_path unless @driver
    @driver.seen!
  end

  def sf_waiting
    @driver = Driver.find_by_id(session[:driver_id])
    return redirect_to root_path unless @driver
    @driver.seen!
  end

  def destroy
    @driver = Driver.find_by_id(session[:driver_id])
    @driver.destroy if @driver
    redirect_to root_path
  end

  private

  def go_to_spot(pickup_spot)
    if pickup_spot.name == "San Francisco"
      redirect_to :action => :set_destination_spot
    else
      @driver = Driver.create!(:pickup_spot => pickup_spot)
      session[:driver_id] = @driver.id
      redirect_to :action => :waiting
    end
  end
end
