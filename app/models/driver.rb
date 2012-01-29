# == Schema Information
#
# Table name: drivers
#
#  id              :integer         not null, primary key
#  number_of_seats :integer         default(0), not null
#  lat             :decimal(3, 10)
#  lng             :decimal(3, 10)
#  last_seen_at    :datetime
#  created_at      :datetime
#  updated_at      :datetime
#

class Driver < ActiveRecord::Base
  MAX_LAST_SEEN_AT = 5.minutes
  attr_accessible :number_of_seats, :lat, :lng, :last_seen_at, :pickup_spot_id, :destination_spot_id
  belongs_to (:pickup_spot)
  belongs_to (:destination_spot)
  validates_presence_of :pickup_spot

  def self.waiting_condition
    {:last_seen_at => MAX_LAST_SEEN_AT.ago..(Time.current)}
  end

  def seen!
    update_attributes(:last_seen_at => Time.current)
  end
end
