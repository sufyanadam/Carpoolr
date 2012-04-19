require 'spec_helper'


describe PickupSpot do
  describe ".find_closest" do
    it "finds the closest pickup spot" do
      [
        [5,5], [0,0], [-5,-5]
      ].each_with_index do |(lat, lng), index|
        PickupSpot.create!(:name => "Spot #{index}", :lat => lat, :lng => lng)
      end

      #SELECT id, latitude, longitude, SQRT(
      #  POW(69.1 * (latitude - [startlat]), 2) +
      #    POW(69.1 * ([startlng] - longitude) * COS(latitude / 57.3), 2)) AS distance
      #FROM TableName HAVING distance < 25 ORDER BY distance LIMIT 1;
      #
      PickupSpot.find_closest(4,4).name.should == "Spot 1"
    end
  end
end