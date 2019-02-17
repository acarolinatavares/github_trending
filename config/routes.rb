Rails.application.routes.draw do
  root 'repositories#home'

  resources :repositories, only: [:index, :show] do
    collection do
      get :search
      get :home
    end
  end
end
