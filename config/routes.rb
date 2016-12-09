Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#new"
  resources :users do
    resource :profile, on: :member, except: [:new, :create, :destroy, :index]
    resources :posts do
      get "delete" => "posts#destroy"
    end
  end

  resource :session, only: [:new, :create, :destroy]
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
end
