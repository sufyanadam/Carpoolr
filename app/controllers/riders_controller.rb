class RidersController < ApplicationController
  
  def new
  end

  def sf_create(rider)
    @destination_spot = DestinationSpot.find_by_id(rider[:destination_spot_id])
    sf_pickup_spot_id = PickupSpot.find_by_name("San Francisco").id
    @rider = Rider.create!(:pickup_spot_id => sf_pickup_spot_id, :destination_spot_id => @destination_spot.id)
    session[:rider_id] = @rider.id
    return redirect_to :action => :sf_waiting
  end

  def create
    rider = params[:rider]

    #return redirect_to :action => :sf_create if @destination_spot
    if rider[:destination_spot_id]
      sf_create(rider)
    else
      @pickup_spot = PickupSpot.find_by_id(rider[:pickup_spot_id])
      #    @pickup_spot = PickupSpot.find_by_id(params[:rider[:pickup_spot_id]])
      #return redirect_to :action => :set_destination_spot if @pickup_spot.name == "San Francisco"
      if @pickup_spot.name == "San Francisco"
        return redirect_to :action => :set_destination_spot
      else
        @rider = Rider.create!(params[:rider])
        session[:rider_id] = @rider.id
        #session[:rider_id] = Rider.create!(params[:rider]).id
        redirect_to :action => :waiting
      end
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
end
