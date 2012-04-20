Carpoolr::Application.routes.draw do
  resources :riders do
    collection do
      get :waiting
      get :set_destination_spot
      get :sf_waiting
    end
  end

  resources :drivers do
    collection do
      get :waiting
      get :set_destination_spot
      get :sf_waiting
    end
  end
  
  resources :pickup_spots

  root :to => 'home#index'
end
