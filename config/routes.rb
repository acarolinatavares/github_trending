Rails.application.routes.draw do
  root 'repositories#index'

  resources :repositories, only: [:index, :show] do
    collection do
      get :search
    end
  end
end
