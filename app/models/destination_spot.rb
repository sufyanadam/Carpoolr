class DestinationSpot < ActiveRecord::Base
  attr_accessible :name
  has_many :waiting_riders, :conditions => lambda { |_| Rider.waiting_condition }, :class_name => "Rider"
  has_many :waiting_drivers, :conditions => lambda { |_| Driver.waiting_condition }, :class_name => "Driver"
  
end
