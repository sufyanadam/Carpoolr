module Drivers
  class FindPickupSpot
    include Interactor

    delegate :driver, to: :context

    def call
      context.pickup_spot = PickupSpot.find_by!(id: driver[:pickup_spot_id])
    end
  end
end
