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

class Rider < ActiveRecord::Base
  MAX_LAST_SEEN_AT = 5.minutes
  attr_accessible :last_seen_at, :destination_spot
  validates_presence_of :pickup_spot_id
  belongs_to(:pickup_spot)
  belongs_to(:destination_spot)

  def self.waiting_condition
    {:last_seen_at => MAX_LAST_SEEN_AT.ago..(Time.current)}
  end

  def self.destination_waiting_condition
    {:last_seen_at => MAX_LAST_SEEN_AT.ago..(Time.current)}
  end

  def seen!
    update_attributes(:last_seen_at => Time.current)
  end
end
