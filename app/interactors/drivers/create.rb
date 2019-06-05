module Drivers
  class Create
    include Interactor::Organizer

    organize FindPickupSpot,
      FindDestinationSpot,
      Persist,
      SetSessionDriverID

  end
end
