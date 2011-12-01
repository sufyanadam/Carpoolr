class AddPickupSpots < ActiveRecord::Migration
  def up
    PickupSpot.create!(:name => "Richmond Parkway")
    PickupSpot.create!(:name => "Hercules")
    PickupSpot.create!(:name => "Fairfield")
    PickupSpot.create!(:name => "Vallejo")
    PickupSpot.create!(:name => "El Cerrito Del Norte")
  end

  def down
  end
end
