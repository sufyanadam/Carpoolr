class DriversController < ApplicationController
  def new
    if location = cookies[:location]
      lat, lng = location.split('--').map(&:to_f)

      go_to_spot PickupSpot.find_closest(lat, lng)
    end
  end

  def create
    Drivers::Create.call(
      driver: params[:driver],
      session: session
    )

    redirect_to action: :waiting
  end

  def set_destination_spot
  end

  def waiting
    @driver = Driver.find_by_id(session[:driver_id])
    @destination_spot = @driver.destination_spot
    return redirect_to root_path unless @driver
    @driver.seen!
  end

  def destroy
    @driver = Driver.find_by_id(session[:driver_id])
    @driver.destroy if @driver
    redirect_to root_path
  end
end
