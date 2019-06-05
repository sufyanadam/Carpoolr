module Drivers
  class FindDestinationSpot
    include Interactor

    delegate :driver, to: :context

    def call
      context.destination_spot = DestinationSpot.find_by(id: driver[:destination_spot_id]) || DestinationSpot.find_by!(name: 'San Francisco')
    end
  end
end
