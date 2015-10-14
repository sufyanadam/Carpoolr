class DestinationSpot < ActiveRecord::Base
  MAX_LAST_SEEN_AT = 5.minutes
  # attr_accessible :name
  has_many :waiting_riders, -> { where(last_seen_at: MAX_LAST_SEEN_AT.ago..(Time.current)) }, :class_name => "Rider"
  has_many :waiting_drivers, -> { where(last_seen_at: MAX_LAST_SEEN_AT.ago..(Time.current)) }, :class_name => "Driver"
  
end
