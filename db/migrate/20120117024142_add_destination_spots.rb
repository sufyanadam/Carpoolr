class AddDestinationSpots < ActiveRecord::Migration[5.2]
  def up
    DestinationSpot.create!(:name => "San Francisco")
    DestinationSpot.create!(:name => "Hercules")
    DestinationSpot.create!(:name => "Richmond Parkway")
    DestinationSpot.create!(:name => "Fairfield")
    DestinationSpot.create!(:name => "Vallejo")
  end

  def down
  end
end
