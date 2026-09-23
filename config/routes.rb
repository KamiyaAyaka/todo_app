Rails.application.routes.draw do
  resources :todos do
    collection do
      get :completed
    end
  end
end
