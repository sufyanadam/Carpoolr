module Drivers
  class SetSessionDriverID
    include Interactor

    delegate :session, :driver, to: :context
    def call
      session[:driver_id] = driver.id
    end
  end
end
