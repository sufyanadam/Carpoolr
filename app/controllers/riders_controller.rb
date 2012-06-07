class RidersController < ApplicationController
  def new
    if location = cookies[:location]
      lat, lng = location.split('--').map(&:to_f)

      go_to_spot PickupSpot.find_closest(lat, lng)
    end
  end

  def sf_create(rider)
    @destination_spot = DestinationSpot.find_by_id(rider[:destination_spot_id])
    pickup_spot = PickupSpot.find_by_name("San Francisco")
    @rider = Rider.create!(:pickup_spot => pickup_spot, :destination_spot => @destination_spot)
    session[:rider_id] = @rider.id
    redirect_to :action => :sf_waiting
  end

  def create
    rider = params[:rider]

    if rider[:destination_spot_id]
      sf_create(rider)
    else
      go_to_spot PickupSpot.find_by_id(rider[:pickup_spot_id])
    end
  end
  
  def waiting
    @rider = Rider.find_by_id(session[:rider_id])
    return redirect_to root_path unless @rider
    @rider.seen!
  end

  def sf_waiting
    @rider = Rider.find_by_id(session[:rider_id])
    return redirect_to root_path unless @rider
    @rider.seen!
  end

  def destroy
    @rider = Rider.find_by_id(session[:rider_id])
    @rider.destroy if @rider
    redirect_to root_path
  end

  def set_destination_spot
  end

  private

  def go_to_spot(pickup_spot)
    if pickup_spot.name == "San Francisco"
      redirect_to :action => :set_destination_spot
    else
      @rider = Rider.create!(:pickup_spot => pickup_spot)
      session[:rider_id] = @rider.id
      redirect_to :action => :waiting
    end
  end
end
