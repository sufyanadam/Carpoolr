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
  attr_accessible :number_of_seats, :lat, :lng, :last_seen_at

  def self.waiting
    where(:last_seen_at => MAX_LAST_SEEN_AT.ago..(Time.now))
  end

  def seen!
    update_attributes(:last_seen_at => Time.now)
  end
end
