class AddPickupSpots < ActiveRecord::Migration
  def up
    PickupSpot.create!(:name => "Alameda (Encinal Ave & Park Ave)", :lat => 37.762074, :long => -122.243378 )
    PickupSpot.create!(:name => "Alameda (Webster & Santa Clara)", :lat => 37.773331, :long => -122.276764)
    PickupSpot.create!(:name => "Albany (Pierce St)", :lat => 37.900124, :long => -122.30928)
    PickupSpot.create!(:name => "Berkeley", :lat => 37.874245, :long => -122.282585)
    PickupSpot.create!(:name => "El Cerrito Del Norte", :lat => 37.921139, :long => -122.317612)
    PickupSpot.create!(:name => "Emeryville (Christie)", :lat => 37.843594, :long => -122.295723)
    PickupSpot.create!(:name => "Emeryville Marina", :lat => 37.837006, :long => -122.304863)
    PickupSpot.create!(:name => "Fairfield", :lat => 38.248501, :long => -122.069)
    PickupSpot.create!(:name => "Hercules", :lat => 38.01334, :long => -122.272133)
    PickupSpot.create!(:name => "Lafayette", :lat => 37.893425, :long => -122.123795)
    PickupSpot.create!(:name => "Moraga", :lat => 37.836021, :long => -122.131409)
   # PickupSpot.create!(:name => "Oakland (Lakeshore & Grand)")
   # PickupSpot.create!(:name => "Oakland Grand & Perkins")
   # PickupSpot.create!(:name => "Oakland (Claremone & College)")
   # PickupSpot.create!(:name => "Oakland (Park & Hollywood)")
   # PickupSpot.create!(:name => "Oakland (Park & Hampel)")
   #  PickupSpot.create!(:name => "Oakland (Fruitvale & Montana)")
   #  PickupSpot.create!(:name => "Oakland (Hudson & Claremont)")
   #  PickupSpot.create!(:name => "Oakland (Oakland & Monte Vista)")
   #  PickupSpot.create!(:name => "Oakland (MacArthur & High)")
    PickupSpot.create!(:name => "Orinda", :lat => 37.878522, :long => -122.183005)
#    PickupSpot.create!(:name => "Piedmont", :lat => 37.825287, :long => -122.235B672)
    PickupSpot.create!(:name => "Richmond", :lat => 37.986526, :long => -122.31633)
    PickupSpot.create!(:name => "Vallejo", :lat => 38.092869, :long => -122.237366)
    PickupSpot.create!(:name => "San Francisco", :lat => 37.789101, :long => -122.395195)

  end

  def down
  end
end
