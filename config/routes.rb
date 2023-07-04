Rails.application.routes.draw do
  resources :gyms, only: [:show, :destroy]
  resources :clients, only: [:show]
  resources :memberships, only: [:create]

  # Bonus route
  get 'clients/:id/total_amount', to: 'clients#total_amount'
end
