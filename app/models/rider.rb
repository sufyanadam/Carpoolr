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
  attr_accessible :pickup_spot_id, :last_seen_at
  validates_presence_of :pickup_spot_id
  belongs_to(:pickup_spot)

  def self.waiting_condition
    {:last_seen_at => MAX_LAST_SEEN_AT.ago..(Time.now)}
  end

  def seen!
    update_attributes(:last_seen_at => Time.now)
  end
end
