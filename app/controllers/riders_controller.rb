class RidersController < ApplicationController
  def create
    #session[:rider_id] = Rider.create!(:pickup_spot_id => pickup_spot_id).id
    session[:rider_id] = Rider.create!(params[:rider]).id
    redirect_to :action => :waiting
  end
  
  def waiting
    @rider = Rider.find_by_id(session[:rider_id])

    return redirect_to root_path unless @rider

    @rider.seen!
  end

  def destroy
    @rider = Rider.find_by_id(session[:rider_id])

    @rider.destroy if @rider

    redirect_to root_path
  end
end
