Rails.application.routes.draw do
  resource :home, controller: :home, only: [:show]
  root to: 'home#show'
  get 'home/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
