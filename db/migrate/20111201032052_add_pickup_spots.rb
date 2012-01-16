class AddPickupSpots < ActiveRecord::Migration
  def up
    PickupSpot.create!(:name => "Alameda (Encinal Ave & Park Ave)", :lat => 37.762074, :lng => -122.243378 )
    PickupSpot.create!(:name => "Alameda (Webster & Santa Clara)", :lat => 37.773331, :lng => -122.276764)
    PickupSpot.create!(:name => "Albany (Pierce St)", :lat => 37.900124, :lng => -122.30928)
    PickupSpot.create!(:name => "Berkeley (NB BART)", :lat => 37.874245, :lng => -122.282585)
    PickupSpot.create!(:name => "El Cerrito Del Norte", :lat => 37.921139, :lng => -122.317612)
    PickupSpot.create!(:name => "Emeryville (Christie)", :lat => 37.843594, :lng => -122.295723)
    PickupSpot.create!(:name => "Emeryville Marina", :lat => 37.837006, :lng => -122.304863)
    PickupSpot.create!(:name => "Fairfield Trns Cntr", :lat => 38.248501, :lng => -122.069)
    PickupSpot.create!(:name => "Hercules Trns Cntr", :lat => 38.01334, :lng => -122.272133)
    PickupSpot.create!(:name => "Lafayette BART", :lat => 37.893425, :lng => -122.123795)
    PickupSpot.create!(:name => "Moraga Way", :lat => 37.836021, :lng => -122.131409)
   # PickupSpot.create!(:name => "Oakland (Lakeshore & Grand)")
   # PickupSpot.create!(:name => "Oakland Grand & Perkins")
   # PickupSpot.create!(:name => "Oakland (Claremone & College)")
   # PickupSpot.create!(:name => "Oakland (Park & Hollywood)")
   # PickupSpot.create!(:name => "Oakland (Park & Hampel)")
   #  PickupSpot.create!(:name => "Oakland (Fruitvale & Montana)")
   #  PickupSpot.create!(:name => "Oakland (Hudson & Claremont)")
   #  PickupSpot.create!(:name => "Oakland (Oakland & Monte Vista)")
   #  PickupSpot.create!(:name => "Oakland (MacArthur & High)")
    PickupSpot.create!(:name => "Orinda BART", :lat => 37.878522, :lng => -122.183005)
    PickupSpot.create!(:name => "Piedmont (Oakland Ave)", :lat => 37.825287, :lng => -122.235672)
    PickupSpot.create!(:name => "Richmond Pkwy", :lat => 37.986526, :lng => -122.31633)
    PickupSpot.create!(:name => "Vallejo (Curtola Pkwy)", :lat => 38.092869, :lng => -122.237366)
    PickupSpot.create!(:name => "San Francisco", :lat => 37.789101, :lng => -122.395195)

  end

  def down
  end
end
