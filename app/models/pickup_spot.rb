# == Schema Information
#
# Table name: pickup_spots
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  lat          :decimal(3, 10)
#  lng          :decimal(3, 10)
#  last_seen_at :datetime
#

class PickupSpot < ActiveRecord::Base

  attr_accessible :name, :lat, :lng
  has_many :waiting_riders, :conditions => Rider.waiting_condition, :class_name => "Rider"
  has_many :waiting_drivers, :conditions => Driver.waiting_condition, :class_name => "Driver"
  
  def self.san_francisco
    find_by_name("San Francisco") || raise("San Francisco not found! (earthquake?)")
  end

end
