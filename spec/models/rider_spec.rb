# == Schema Information
#
# Table name: riders
#
#  id             :integer         not null, primary key
#  pickup_spot_id :integer
#  last_seen_at   :datetime
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe Rider do
  describe "validations" do
    it "needs a pickup_spot_id" do
      rider = Rider.new
      rider.save
      rider.errors[:pickup_spot_id].should_not == []
    end
  end

end
