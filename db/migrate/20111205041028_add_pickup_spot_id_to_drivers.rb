class AddPickupSpotIdToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :pickup_spot_id, :integer
  end
end
