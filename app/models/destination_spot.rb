class DestinationSpot < ActiveRecord::Base
  attr_accessible :name
  has_many :waiting_riders, :conditions => Rider.waiting_condition, :class_name => "Rider"
  has_many :waiting_drivers, :conditions => Driver.waiting_condition, :class_name => "Driver"
  
end
