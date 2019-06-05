module Drivers
  class Persist
    include Interactor

    delegate :pickup_spot, :destination_spot, to: :context

    def call
      context.driver = Driver.create!(
        pickup_spot: pickup_spot,
        destination_spot: destination_spot
      )
    end
  end
end
