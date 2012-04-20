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

  reverse_geocoded_by :lat, :lng

  has_many :waiting_riders, :conditions => lambda {|_| Rider.waiting_condition }, :class_name => "Rider"
  has_many :waiting_drivers, :conditions => lambda { |_| Driver.waiting_condition }, :class_name => "Driver"

  
  def self.san_francisco
    find_by_name("San Francisco") || raise("San Francisco not found! (earthquake?)")
  end

  def self.find_closest(lat, lng)
    self.near([lat, lng], 1).first
  end
end
