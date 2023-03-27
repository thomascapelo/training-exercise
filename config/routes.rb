Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/instructions", to: "pages#instructions", as: "instructions"

  resources :trees do 
    resources :adoptions, only: [:new, :create]
  end
end
